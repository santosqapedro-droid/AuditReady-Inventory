# AuditReady Inventory

AuditReady Inventory is a system designed for registering and managing GxP-relevant software assets within regulated industries, such as Pharmaceuticals and MedTechs.

## 🎯 Project Objective
The goal of this project is to demonstrate a robust Software Life Cycle (SLC) and Lifecycle Management approach. Beyond simple registration, the system implements automated compliance monitoring, ensuring that all inventory records are traceable, validated, and proactively managed throughout their operational life until decommissioning (Retirement).

## 🛠️ Tech Stack
* **Database:** SQLite (SQL-based inventory)
* **Project Management:** Jira (Agile/Scrum)
* **Documentation:** GitHub Markdown (Test Planning and README)

## 🚀 Key Compliance Features (Updated)

### 1. Automated Compliance Logic (Single Source of Truth)
The system no longer relies on manual status entries. By utilizing a **SQL View (`VW_Inventory_Compliance_Status`)**, the compliance state is calculated in real-time based on the `Last_Validation_Date`.
* **Validated:** Systems validated within the last 11 months.
* **Perform_the_revalidation:** Proactive alert triggered at the 11-month threshold (335 days) to ensure enough time for revalidation before expiration.
* **Validation Expired:** Automatic flagging of systems exceeding the 12-month limit.

### 2. Lifecycle Control & Decommissioning
The database handles the **System Life Cycle** (Concept, Project, Operation, Retirement) with integrated logic:
* **Decommissioning Flow:** When an asset is marked as `Retirement`, the system automatically overrides validation alerts and sets the status to `Decommissioned`.
* **Audit Integrity:** Ensures that retired assets remain in the database for historical audit purposes without generating false-positive compliance alerts.

### 3. Database Integrity & GxP Standards
* **Data Integrity by Design:** Implementation of SQLite `CHECK` constraints to enforce mandatory fields and valid ranges (e.g., GAMP 5 Risk 1-5).
* **Audit Metadata:** Every record tracks `Created_At` and `Created_By` to ensure traceability, meeting ALCOA+ principles.
* **No-Delete Policy:** The architecture encourages lifecycle transitions over record deletion, preserving the electronic Audit Trail.
