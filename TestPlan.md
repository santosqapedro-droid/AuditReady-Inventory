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
| **TC-03** | **Valid Date & Status Entry** | Verify if the system accepts correct date formats and the `Active status`. | Record is successfully saved with ISO8601 dates and `Lifecycle_Status = 'Active'`. | ARI-6 |
| **TC-04** | **Proactive KPI Filtering** | Execute the 30-day monitoring query for systems nearing expiration. | Query returns only active systems whose `Next_Validation_Date` is within the 30-day window. | ARI-7 |
| **TC-04-A** | **System Retirement Process** | Execute the update script to decommission a software asset. | Record status changes to `Retired`, and all historical data (Audit Trail) remains intact. | ARI-9 |

---

### 3.2 Negative Scenarios (Data Integrity & Constraints)

| ID | Scenario | Goal | Expected Result | Traceability |
|:---|:---|:---|:---|:---|
| **TC-05** | **GAMP Risk Range Violation** | Attempt to insert a record with a `GAMP_Risk` value of 6 or 0. | Database must reject the entry due to the `CHECK` constraint (Range 1-5). | ARI-4 |
| **TC-06** | **Mandatory Field Validation** | Attempt to insert a record without the `System_Name` (Null Test). | Database must return a `NOT NULL` constraint error and prevent saving. | ARI-4 |
| **TC-07** | **Invalid Lifecycle Data** | Attempt to insert an unauthorized status (e.g., 'Deleted') or invalid date format. | Database rejects the entry due to `CHECK` constraints or data type mismatch. | ARI-6 |
| **TC-08** | **False Positive Prevention** | Check if the monitoring query ignores expired systems that are already `Retired`. | Systems marked as `Retired` do not appear in the "Upcoming Deadlines" report, even if dates are past. | ARI-7 |
| **TC-09** | **Unauthorized Data Deletion** | Attempt to permanently delete a record from the database. | The operation is blocked or fails, enforcing the "No-Delete" policy for GxP compliance. | ARI-9 |

---

### 4. Test Execution Status (Tracking)

- [X] **TC-01** - (ARI-4)
- [X] **TC-02** - (ARI-5)
- [ ] **TC-03** - (ARI-6)
- [ ] **TC-04** - (ARI-7)
- [ ] **TC-04-A** - (ARI-9)
- [X] **TC-05** - (ARI-4)
- [X] **TC-06** - (ARI-4)
- [ ] **TC-07** - (ARI-6)
- [ ] **TC-08** - (ARI-7)
- [ ] **TC-09** - (ARI-9)

## 5. Evidence & Traceability
All test executions will be evidenced by screenshots of the SQL terminal results and attached to their respective Jira User Stories (ARI-4 to ARI-9) and the Test Execution Log (Github repository) for audit purposes.
