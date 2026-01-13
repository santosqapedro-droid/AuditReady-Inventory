# Test Plan - AuditReady Inventory

## 1. Objective
This test plan defines the strategy to test the Software Inventory database, ensuring that all Data Integrity rules and GxP compliance requirements are met as defined in the technical refinement phase.

## 2. Scope of Testing
The testing activities cover the database schema creation, data insertion, lifecycle updates, and compliance reporting.

## 3. Test Scenarios & Cases

### 3.1 Positive Scenarios (Happy Path)

| ID | Scenario | Goal | Expected Result | Traceability |
|:---|:---|:---|:---|:---|
| **TC-01** | **Database Schema Verification** | Verify if the `Software_Inventory` table is created with all mandatory fields and correct data types. | Table created successfully in SQLite with all columns defined in `schema.sql`. | ARI-4 |
| **TC-02** | **Valid Data Entry** | Insert a realistic GxP record (e.g., SAP, LIMS) with all valid parameters. | Record saved with an auto-generated ID and correct `Created_At` timestamp. | ARI-5 |
| **TC-03** | **Date Management** | Execute a query to list or filter systems based on the `Validation_Date`. | The database correctly identifies systems based on the stored date values. | ARI-6 |
| **TC-04** | **Data Retrieval & Update** | Execute a `SELECT` query followed by an `UPDATE` on a specific record. | Data is retrieved accurately and the update reflects the new info (e.g., Version) without affecting other rows. | ARI-7 / ARI-9 |

---

### 3.2 Negative Scenarios (Data Integrity & Constraints)

| ID | Scenario | Goal | Expected Result | Traceability |
|:---|:---|:---|:---|:---|
| **TC-05** | **GAMP Risk Range Violation** | Attempt to insert a record with a `GAMP_Risk` value of 6 or 0. | Database must reject the entry due to the `CHECK` constraint (Range 1-5). | ARI-4 |
| **TC-06** | **Mandatory Field Validation** | Attempt to insert a record without the `System_Name` (Null Test). | Database must return a `NOT NULL` constraint error and prevent saving. | ARI-4 |
| **TC-07** | **Invalid System Status** | Attempt to update or insert a status not included in the approved list (e.g., 'Deleted'). | Update rejected due to the `CHECK (Validation_Status IN (...))` constraint. | ARI-8 |

---

### 4. Test Execution Status (Tracking)

- [X] **TC-01** - (ARI-4)
- [X] **TC-02** - (ARI-5)
- [ ] **TC-03** - (ARI-6)
- [ ] **TC-04** - (ARI-7/9)
- [X] **TC-05** - (ARI-4)
- [X] **TC-06** - (ARI-4)
- [ ] **TC-07** - (ARI-8)

## 5. Evidence & Traceability
All test executions will be evidenced by screenshots of the SQL terminal results and attached to their respective Jira User Stories (ARI-4 to ARI-9) and the Test Execution Log (Github repository) for audit purposes.
