---
name: n8n-expert
description: Comprehensive n8n workflow automation and AI agent suite. Covers workflow patterns, node configuration, expression syntax, error handling, subworkflows, custom JS/Python code tools, AI agent nodes, multi-instance management, and n8n MCP tools.
---

# n8n Automation & AI Workflow Expert

A complete engineering guide and reference suite for building robust, fault-tolerant n8n automation pipelines and AI agents.

When building or debugging n8n workflows, locate the corresponding topic in `references/<category>/<topic>/SKILL.md`.

---

## Catalog & Quick Navigation

### 1. Workflow Architecture & Core Logic (`references/core-and-workflow/`)
| Topic | Subpath | Description |
| :--- | :--- | :--- |
| **n8n-workflow-patterns** | `core-and-workflow/n8n-workflow-patterns` | Battle-tested architectures: webhooks, polling, batch processing, queue systems, and scheduled jobs. |
| **n8n-node-configuration** | `core-and-workflow/n8n-node-configuration` | Operation-aware node parameters, required fields, and credential association. |
| **n8n-expression-syntax** | `core-and-workflow/n8n-expression-syntax` | Data mapping with `{{ $json... }}`, `$node`, JMESPath filters, and cross-item iterations. |
| **n8n-error-handling** | `core-and-workflow/n8n-error-handling` | Loud error wiring, continueOnFail, error-trigger subworkflows, retries, and 4xx/5xx status codes. |
| **n8n-subworkflows** | `core-and-workflow/n8n-subworkflows` | Modular sub-workflow extraction, Execute Workflow nodes, and batch vs single execution modes. |
| **n8n-validation-expert** | `core-and-workflow/n8n-validation-expert` | Interpreting validation warnings, operator structures, and schema enforcement. |

### 2. Code, Scripts & Binary Data (`references/code-and-data/`)
| Topic | Subpath | Description |
| :--- | :--- | :--- |
| **n8n-code-tool** | `code-and-data/n8n-code-tool` | AI-agent-callable tool scripting (NodeLangchain.toolCode), parameter schemas, and string outputs. |
| **n8n-code-javascript** | `code-and-data/n8n-code-javascript` | Custom Code node execution in JS sandbox (Luxon dates, lodash, regex, item looping). |
| **n8n-code-python** | `code-and-data/n8n-code-python` | Python Code node execution, data transformations, and math/string processing. |
| **n8n-binary-and-data** | `code-and-data/n8n-binary-and-data` | Handling files, PDFs, images, base64 data, and preserving binary attachments across nodes. |

### 3. AI Agents & LangChain (`references/ai-and-agents/`)
| Topic | Subpath | Description |
| :--- | :--- | :--- |
| **n8n-agents** | `ai-and-agents/n8n-agents` | Designing n8n AI Agents: LLM chains, memory (WindowBuffer/Redis), tools, and structured outputs. |

### 4. Management, Hosting & MCP (`references/management-and-mcp/`)
| Topic | Subpath | Description |
| :--- | :--- | :--- |
| **n8n-mcp-tools-expert** | `management-and-mcp/n8n-mcp-tools-expert` | Calling n8n MCP tools to query, update, create, or validate workflows and credentials. |
| **n8n-multi-instance** | `management-and-mcp/n8n-multi-instance` | Routing MCP operations between staging, production, and multiple team instances. |
| **n8n-self-hosting** | `management-and-mcp/n8n-self-hosting` | Docker Compose setups, PostgreSQL backend, webhook tunneling, and environment variables. |
| **using-n8n-mcp-skills** | `management-and-mcp/using-n8n-mcp-skills` | Meta router and rules to keep production workflows from breaking. |
