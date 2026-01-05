CREATE TABLE Software_Inventory (
  id integer PRIMARY KEY AUTOINCREMENT,
  System_Name varchar (30) NOT NULL,
  System_Vendor varchar (30) NOT NULL,
  System_Version varchar (10) NOT NULL,
  Validation_Date date,
  Validation_Status TEXT NOT NULL CHECK (Validation_Status IN ('In validation', 'Validated', 'Validation Expired')),
  GAMP_Risk integer NOT NULL CHECK (GAMP_Risk BETWEEN 1 AND 5),
  Created_At DATETIME DEFAULT CURRENT_TIMESTAMP,
  Created_By TEXT
  );
