CREATE TABLE Software_Inventory (
  id integer PRIMARY KEY AUTOINCREMENT,
  System_Name varchar (30) NOT NULL CHECK(length(trim(system_name)) > 0),
  System_Vendor varchar (30) NOT NULL CHECK(length(trim(system_vendor)) > 0),
  System_Version varchar (10) NOT NULL CHECK(length(trim(system_version)) > 0),
  Validation_Date date,
  Validation_Status TEXT NOT NULL CHECK (Validation_Status IN ('In validation', 'Validated', 'Validation Expired')),
  GAMP_Risk integer NOT NULL CHECK (GAMP_Risk BETWEEN 1 AND 5),
  Created_At DATETIME DEFAULT CURRENT_TIMESTAMP,
  Created_By varchar (30) NOT NULL CHECK(length(trim(created_by)) > 0)
  );
