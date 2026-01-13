-- Software Inventory Schema
-- Project: AuditReady Inventory

-- Table structure for software assets with Data Integrity constraints
CREATE TABLE Software_Inventory (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    System_Name VARCHAR(30) NOT NULL CHECK(length(trim(System_Name)) > 0),
    System_Vendor VARCHAR(30) NOT NULL CHECK(length(trim(System_Vendor)) > 0),
    System_Version VARCHAR(10) NOT NULL CHECK(length(trim(System_Version)) > 0),
    System_Life_Cycle TEXT NOT NULL CHECK (System_Life_Cycle IN ('Concept', 'Project', 'Operation', 'Retirement')),
    Last_Validation_Date DATE,
    GAMP_Risk INTEGER NOT NULL CHECK (GAMP_Risk BETWEEN 1 AND 5),
    Created_At DATETIME DEFAULT CURRENT_TIMESTAMP,
    Created_By VARCHAR(30) NOT NULL CHECK(length(trim(Created_By)) > 0)
);

-- Automated Compliance View for real-time status monitoring
CREATE VIEW VW_Inventory_Compliance_Status AS
SELECT 
    *,
    CASE 
        WHEN System_Life_Cycle = 'Retirement' THEN 'Decommissioned'
        WHEN Last_Validation_Date IS NULL THEN 'In validation'
        WHEN (julianday('now') - julianday(Last_Validation_Date)) < 335 THEN 'Validated'
        WHEN (julianday('now') - julianday(Last_Validation_Date)) BETWEEN 335 AND 365 THEN 'Perform_the_revalidation'
        ELSE 'Validation Expired'
    END AS Calculated_Status
FROM Software_Inventory;
