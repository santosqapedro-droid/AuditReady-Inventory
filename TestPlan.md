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
| **TC-03** | **Valid Date & Lifecycle Automation** | Insert a record with `System_Life_Cycle = 'Operation'` and a valid `Last_Validation_Date` (e.g., today's date). | The record is saved successfully in the table, and the `VW_Inventory_Compliance_Status` view automatically calculates the `Calculated_Status` as 'Validated'. | ARI-6 |
| **TC-04** | **Proactive Monitoring Logic** | Query the `VW_Inventory_Compliance_Status` for systems with the status `Perform_the_revalidation`. | The View correctly identifies and returns only systems within the 11 to 12-month window. | ARI-7 |
| **TC-04-A** | **System Retirement Logic** | Update an asset's `System_Life_Cycle` to 'Retirement'. | The `Calculated_Status` in the View immediately changes to 'Decommissioned', overriding any dates. | ARI-9 |

---

### 3.2 Negative Scenarios (Data Integrity & Constraints)

| ID | Scenario | Goal | Expected Result | Traceability |
|:---|:---|:---|:---|:---|
| **TC-05** | **GAMP Risk Range Violation** | Attempt to insert a record with a `GAMP_Risk` value of 6 or 0. | Database must reject the entry due to the `CHECK` constraint (Range 1-5). | ARI-4 |
| **TC-06** | **Mandatory Field Validation** | Attempt to insert a record without the `System_Name` (Null Test). | Database must return a `NOT NULL` constraint error and prevent saving. | ARI-4 |
| **TC-07** | **Data Integrity - Lifecycle & Date Constraints** | Attempt to insert a record with an unauthorized lifecycle status (e.g., 'Deleted') or an invalid date format (e.g., '13/01/2026'). | The database must reject the entry due to `CHECK` constraint violation or data type mismatch, preventing inconsistent data from being stored. | ARI-6 |
| **TC-08** | **Automated Compliance Threshold (11 months)** | Insert a record with a `Last_Validation_Date` from 340 days ago. | The system automatically flags the asset as `Perform_the_revalidation` in the View. | ARI-6 |
| **TC-09** | **Compliance State Isolation** | Check if the View distinguishes between 'Expired' (Active) and 'Decommissioned' (Retired) systems. | Systems marked as 'Retirement' do not trigger 'Expired' or 'Revalidation' alerts, even if the date is old. | ARI-7 |
| **TC-10** | **Data Integrity Enforcement** | Attempt to delete a record or insert an invalid `System_Life_Cycle` (e.g., 'Deleted'). | The `CHECK` constraints or the "No-Delete" policy (Project Rule) ensures data remains intact for Audit Trail. | ARI-9 |

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
- [ ] **TC-08** - (ARI-6)
- [ ] **TC-09** - (ARI-7)
- [ ] **TC-10** - (ARI-9)

## 5. Evidence & Traceability
All test executions will be evidenced by screenshots of the SQL terminal results and attached to their respective Jira User Stories (ARI-4 to ARI-9) and the Test Execution Log (Github repository) for audit purposes.
