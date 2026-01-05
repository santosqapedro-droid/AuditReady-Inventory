# Test Plan - AuditReady Inventory

## 1. Objective
This test plan defines the strategy for validating the Software Inventory database, ensuring that all Data Integrity rules and GxP compliance requirements are met as defined in the technical refinement phase.

## 2. Scope of Testing
The testing activities cover the database schema creation, data insertion, lifecycle updates, and compliance reporting.

## 3. Test Scenarios

### 3.1 Positive Scenarios (Happy Path)
* **TC-01: Database Schema Validation**
    * **Goal:** Verify if the `Software_Inventory` table is created with all mandatory fields and correct data types.
    * **Expected Result:** Table created successfully in SQLite.
* **TC-02: Data Entry Compliance**
    * **Goal:** Insert a realistic GxP record (e.g., SAP, LIMS) with all valid parameters.
    * **Expected Result:** Record saved with an auto-generated ID and correct `Created_At` timestamp.
* **TC-03: Expiration Reporting**
    * **Goal:** Execute the SQL query to list systems expiring within 30 days.
    * **Expected Result:** The query correctly identifies systems based on the `Next_Validation_Date`.

### 3.2 Negative Scenarios (Data Integrity & Constraints)
* **TC-04: GAMP Risk Range Violation**
    * **Goal:** Attempt to insert a record with `GAMP_Risk` value of 6.
    * **Expected Result:** Database must reject the entry due to the `CHECK` constraint.
* **TC-05: Mandatory Field Validation (Null Test)**
    * **Goal:** Attempt to insert a record without the `System_Name`.
    * **Expected Result:** Database must return a `NOT NULL` constraint error.
* **TC-06: Invalid System Status**
    * **Goal:** Attempt to update a system status to a value not included in the approved list (e.g., 'Deleted').
    * **Expected Result:** Update rejected by the database.

## 4. Evidence & Traceability
All test executions will be evidenced by screenshots of the SQL terminal results and attached to their respective Jira User Stories (ARI-4 to ARI-9) for audit purposes.
