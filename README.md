# AuditReady Inventory

AuditReady Inventory is a system designed for registering and managing GxP-relevant software assets within regulated industries, such as Pharmaceuticals and MedTechs.

## 🎯 Project Objective
The goal of this project is to demonstrate a robust Software Life Cycle (SLC) and Lifecycle Management approach. Beyond simple registration, the system implements automated compliance monitoring, ensuring that all inventory records are traceable, validated, and proactively managed throughout their operational life until decommissioning (Retirement).

## 🛠️ Tech Stack
* **Database:** SQLite (SQL-based inventory)
* **Project Management:** Jira (Agile/Scrum)
* **Documentation:** GitHub Markdown (Test Planning and README)

## 🛡️ Key Compliance Features
* **Technical Refinement:** All requirements were refined in Jira with specific data integrity rules.
* **Database Integrity:** Implementation of CHECK constraints (e.g., GAMP Risk 1-5) and NOT NULL fields to prevent data corruption.
* **Traceability (Audit Trail):** Automatic generation of timestamps (Created_At) and authorship (Created_By) for every record.
* **Automated Validation Lifecycle (New):** Implementation of automated status logic based on Next_Validation_Date, shifting from manual tracking to a data-driven compliance model.
* **Lifecycle Control & Decommissioning (New):** Dedicated "System Retirement" logic that preserves historical data for audits while disabling active validation alerts, ensuring a clean and accurate inventory "Health Score".
* **Proactive KPI Reporting (New):** SQL-based monitoring queries designed to identify upcoming validation deadlines (30-day outlook), preventing compliance gaps before they occur.
