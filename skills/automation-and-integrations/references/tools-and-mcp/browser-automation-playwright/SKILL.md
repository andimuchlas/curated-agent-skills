---
name: browser-automation-playwright
description: >-
  Controls headless/headed browser sessions via Playwright. Automates web navigation, dynamic form filling, screenshot capture, DOM scraping, end-to-end user journeys, and web UI testing.
---

# Browser Automation & Playwright Skill

A practical guide for browser automation, end-to-end testing, visual verification, and scraping using Playwright.

## 1. Core Automation Best Practices
- **Resilient Selectors**: Prefer user-facing locators (`getByRole`, `getByText`, `getByLabel`) over brittle CSS/XPath selectors.
- **Auto-Waiting**: Rely on Playwright's built-in auto-waiting rather than arbitrary `sleep()` calls.
- **Headless & Network Interception**: Use route mocks for predictable tests and fast execution.

## 2. Standard Workflow Pattern
```typescript
import { test, expect } from '@playwright/test';

test('verify user checkout flow', async ({ page }) => {
  await page.goto('/dashboard');
  await page.getByRole('button', { name: 'New Project' }).click();
  await page.getByLabel('Project Name').fill('Alpha Launch');
  await page.getByRole('button', { name: 'Create' }).click();
  await expect(page.getByText('Project Alpha Launch created')).toBeVisible();
  await page.screenshot({ path: 'artifacts/checkout-success.png', fullPage: true });
});
```
