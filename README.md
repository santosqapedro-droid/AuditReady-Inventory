# AuditReady Inventory

AuditReady Inventory is a system designed for registering and managing GxP-relevant software assets within regulated industries, such as Pharmaceuticals and MedTechs.

## 🎯 Project Objective
The goal of this project is to demonstrate a robust Software Life Cycle (SLC) management approach, focusing on **Data Integrity** and **Audit Readiness**. It ensures that all inventory records are traceable, validated, and compliant with FDA, Eudralex and GAMP 5 principles.

## 🛠️ Tech Stack
* **Database:** SQLite (SQL-based inventory)
* **Project Management:** Jira (Agile/Scrum)
* **Documentation:** GitHub Markdown (Test Planning and README)

## 🛡️ Key Compliance Features
* **Technical Refinement:** All requirements were refined in Jira with specific data integrity rules.
* **Database Integrity:** Implementation of `CHECK` constraints (e.g., GAMP Risk 1-5) and `NOT NULL` fields to prevent data corruption.
* **Traceability (Audit Trail):** Automatic generation of timestamps (`Created_At`) and authorship (`Created_By`) for every record.
