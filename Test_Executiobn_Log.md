# Test Execution Log - AuditReady Inventory

## Record of Test Executions - Sprint 1

### [TC-01] Database Schema Verification
**Status:** ✅ PASSED  
**Date:** 2026-01-06  
**Executed by:** @santosqapedro-droid  
**Environment:** SQLite Online IDE  

---

#### 1. Description
Verify if the `Software_Inventory` table is created with all mandatory fields and correct data types according to the technical specification.

#### 2. Test Classification
* **Type:** Functional / Database Testing.
* **Method:** White Box (Knowledge of `schema.sql`).
* **Granularity:** Unit Testing.
* **Goal:** Smoke Test (Critical initial check).

#### 3. Execution Script
```sql
PRAGMA table_info('Software_Inventory');
```

### [TC-05] GAMP Risk Range Violation
**Status:** ✅ PASSED  
**Date:** 2026-01-09  
**Executed by:** @santosqapedro-droid  
**Environment:** SQLite Online IDE  

---

#### 1. Description
Attempt to insert a record with a GAMP_Risk value of 6 or 0.

#### 2. Test Classification
* **Type:** Data Integrity Testing / Database Testing.
* **Method:** White Box (Knowledge of `schema.sql`).
* **Granularity:** Unit Testing.
* **Goal:** To verify the Negative Scenario and Boundary Value.

#### 3. Execution Script
```sql
INSERT INTO Software_Inventory (system_name, system_vendor, system_version, validation_date, validation_status, gamp_risk)
VALUES ('Vault', 'Veeva', '2.0', '08/01/2026', 'Validated', '0');
```

```sql
INSERT INTO Software_Inventory (system_name, system_vendor, system_version, validation_date, validation_status, gamp_risk)
VALUES ('Vault', 'Veeva', '2.0', '08/01/2026', 'Validated', '6');
```

