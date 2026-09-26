---
name: xlsx-master
description: >-
  Builds financial models, spreadsheets, automated formulas (VLOOKUP, INDEX/MATCH, XLOOKUP), conditional formatting, and charts in Excel/XLSX.
---

# XLSX Master Skill

Engineering guide for spreadsheet automation, financial modeling, and pivot table generation with `openpyxl` and Pandas.

## 1. Spreadsheet Architecture
- **Separation of Concerns**: Dedicated sheets for Raw Data, Calculations/Engine, and Dashboard/Presentation.
- **Formula Standards**: Use dynamic arrays and `XLOOKUP` over legacy lookup formulas.
- **Visual Polish**: Freeze top header panes, format currency/percentages explicitly, and apply clean zebra striping.
