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

### [TC-06] Mandatory Field Validation
**Status:** ✅ PASSED  
**Date:** 2026-01-11  
**Executed by:** @santosqapedro-droid  
**Environment:** SQLite Online IDE  

---

#### 1. Description
Attempt to insert a record without the System_Name (Null Test).

#### 2. Test Classification
* **Type:** Data Integrity Testing / Database Testing.
* **Method:** Gray Box (Knowledge of `schema.sql`).
* **Granularity:** Unit Testing.
* **Goal:** Check if the database enforces data integrity by returning NOT NULL and CHECK constraint errors, preventing invalid or empty data from being saved.

#### 3. Execution Script
```sql
INSERT INTO Software_Inventory (system_name, system_vendor, system_version, validation_date, validation_status, gamp_risk, created_by)
VALUES ('', 'CQV & CSV Solution', '1.0', '10/01/2026', 'Validated', '5', 'Pedro A');
```

```sql
INSERT INTO Software_Inventory (system_name, system_vendor, system_version, validation_date, validation_status, gamp_risk, created_by)
VALUES ('AuditReady-Inventory', '', '1.0', '10/01/2026', 'Validated', '5', 'Pedro A');
```

```sql
INSERT INTO Software_Inventory (system_name, system_vendor, system_version, validation_date, validation_status, gamp_risk, created_by)
VALUES ('AuditReady-Inventory', 'CQV & CSV Solution', '', '10/01/2026', 'Validated', '5', 'Pedro A');
```

```sql
INSERT INTO Software_Inventory (system_name, system_vendor, system_version, validation_date, validation_status, gamp_risk, created_by)
VALUES ('AuditReady-Inventory', 'CQV & CSV Solution', '1.0', '10/01/2026', '', '5', 'Pedro A');
```

```sql
INSERT INTO Software_Inventory (system_name, system_vendor, system_version, validation_date, validation_status, gamp_risk, created_by)
VALUES ('AuditReady-Inventory', 'CQV & CSV Solution', '1.0', '10/01/2026', 'Validated', '5', '');
```

