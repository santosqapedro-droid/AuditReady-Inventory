-- Seed Data for Software Inventory
-- Project: AuditReady Inventory
-- Purpose: Populating initial data to validate compliance logic and views

-- Cleaning existing data before insertion
DELETE FROM Software_Inventory;

-- Inserting records with different lifecycle stages and validation dates
INSERT INTO Software_Inventory 
(System_Name, System_Vendor, System_Version, System_Life_Cycle, Last_Validation_Date, GAMP_Risk, Created_By)
VALUES 
('Veeva Vault', 'Veeva Systems', '23R3', 'Operation', '2026-01-13', 5, 'Admin_User'),
('SAP S/4HANA', 'SAP', '2023', 'Operation', '2025-01-20', 4, 'Admin_User'),
('TrackWise', 'Sparta Systems', '10.0', 'Operation', '2024-06-01', 5, 'System_Analyst'),
('Legacy LIMS', 'LabWare', '6.0', 'Retirement', '2020-05-15', 3, 'Admin_User'),
('LMS Platform', 'Cornerstone', '2024.1', 'Project', NULL, 2, 'HR_Manager');

-- Note: 
-- 1. Veeva Vault: Should appear as 'Validated'
-- 2. SAP S/4HANA: Should appear as 'Perform_the_revalidation' (near 12 months)
-- 3. TrackWise: Should appear as 'Validation Expired'
-- 4. Legacy LIMS: Should appear as 'Decommissioned' (Retirement override)
-- 5. LMS Platform: Should appear as 'In validation' (Date is NULL)
