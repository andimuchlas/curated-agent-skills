---
name: mcp-builder
description: >-
  Expert guide for designing, building, testing, and deploying Model Context Protocol (MCP)
  servers and clients in TypeScript/Node.js and Python (FastMCP). Implements tools, resources,
  prompts, standard schemas (JSON Schema / Zod / Pydantic), error handling, streaming,
  stdio/SSE transports, authentication, and security isolation. Use when creating new MCP
  servers, connecting external APIs/databases to AI agents, or debugging MCP tool integrations.
---

# MCP Builder Skill

A complete engineering guide for building production-ready Model Context Protocol (MCP) servers and tool ecosystems.

---

## 1. Core MCP Primitives

1. **Tools**: Executable functions that agents can invoke with arguments to perform actions or side-effects.
2. **Resources**: URI-addressable data (files, database tables, logs, documentation) that can be read or subscribed to by clients.
3. **Prompts**: Reusable prompt templates and workflows exposed to users/agents.

---

## 2. Server Implementation Patterns

### A. TypeScript / JavaScript (Official MCP TypeScript SDK)

```typescript
import { Server } from "@modelcontextprotocol/sdk/server/index.js";
import { StdioServerTransport } from "@modelcontextprotocol/sdk/server/stdio.js";
import {
  CallToolRequestSchema,
  ListToolsRequestSchema,
} from "@modelcontextprotocol/sdk/types.js";
import { z } from "zod";

const server = new Server(
  { name: "custom-service-mcp", version: "1.0.0" },
  { capabilities: { tools: {}, resources: {} } }
);

// 1. Register Available Tools
server.setRequestHandler(ListToolsRequestSchema, async () => {
  return {
    tools: [
      {
        name: "query_database",
        description: "Executes a parameterized read-only query against the analytics database.",
        inputSchema: {
          type: "object",
          properties: {
            sql: { type: "string", description: "The SQL query string" },
            limit: { type: "number", description: "Maximum rows to return" },
          },
          required: ["sql"],
        },
      },
    ],
  };
});

// 2. Handle Tool Invocations
server.setRequestHandler(CallToolRequestSchema, async (request) => {
  const { name, arguments: args } = request.params;
  if (name === "query_database") {
    try {
      const result = await executeQuery(args?.sql, args?.limit);
      return {
        content: [{ type: "text", text: JSON.stringify(result, null, 2) }],
      };
    } catch (error: any) {
      return {
        isError: true,
        content: [{ type: "text", text: `Query execution error: ${error.message}` }],
      };
    }
  }
  throw new Error(`Tool not found: ${name}`);
});

// 3. Connect Transport
const transport = new StdioServerTransport();
await server.connect(transport);
```

### B. Python (FastMCP SDK)

```python
from mcp.server.fastmcp import FastMCP
from pydantic import BaseModel, Field

mcp = FastMCP("Custom Python MCP Server")

class SearchQuery(BaseModel):
    query: str = Field(description="Search keyword or regex pattern")
    max_results: int = Field(default=10, description="Max count of items to return")

@mcp.tool()
async def search_records(query: str, max_results: int = 10) -> str:
    """Search records across local knowledge base."""
    # Execute tool logic
    results = perform_search(query, max_results)
    return str(results)

@mcp.resource("config://app-settings")
async def get_app_settings() -> str:
    """Fetch current application configuration."""
    return read_config_file()

if __name__ == "__main__":
    mcp.run(transport="stdio")
```

---

## 3. Best Practices for MCP Tool Design

1. **Tool Granularity & Descriptions**:
   - Write clear, unambiguous tool descriptions. Explain *what* the tool does, *what inputs* are required, and *what outputs* to expect.
   - Design atomic tools rather than mega-tools that do 10 different unrelated things.
2. **Robust Input Validation**:
   - Validate all arguments using JSON Schema, Zod, or Pydantic before executing business logic.
3. **Structured Error Handling**:
   - Set `isError: true` in tool responses when an operation fails rather than crashing the transport process.
   - Return descriptive error messages that guide the agent on how to correct the parameters.
4. **Security & Sandboxing**:
   - Prevent command injection, path traversal (`../`), and arbitrary code execution.
   - Sanitize all external inputs.
   - Never log sensitive credentials (API keys, tokens) to stderr/stdout.
