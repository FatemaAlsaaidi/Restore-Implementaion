Use TrainingDB
Select * from Students

--Full BackUp
BACKUP DATABASE TrainingDB TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\Backup\TrainingDB_Full.bak';

INSERT INTO Students VALUES (5, 'Fatma hamed', '2024-01-10');

----Differential Backup
BACKUP DATABASE TrainingDB TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\Backup\TrainingDB_Diff.bak' WITH DIFFERENTIAL; 

--Transaction Log Backup
-- First make sure Recovery Model is FULL 
ALTER DATABASE TrainingDB SET RECOVERY FULL;

-- Now backup the log 
BACKUP LOG TrainingDB TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\Backup\TrainingDB_Log.trn'; 

--Copy-Only Backup
BACKUP DATABASE TrainingDB TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\Backup\TrainingDB_CopyOnly.bak' WITH 
COPY_ONLY;

--============================== Step 1: Drop the Current Database (Simulate System Failure)================================
DROP DATABASE TrainingDB; 

-- To be able to delete database we need to chnge the use of database
USE master;

-- 1. Restore FULL backup 
RESTORE DATABASE TrainingDB  
FROM DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\Backup\TrainingDB_Full.bak' 
WITH NORECOVERY; 

-- 2. Restore DIFFERENTIAL backup (if you created one) 
RESTORE DATABASE TrainingDB  
FROM DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\Backup\TrainingDB_Diff.bak' 
WITH NORECOVERY;

-- 3. Restore TRANSACTION LOG backup (if you created one) 
RESTORE LOG TrainingDB  
FROM DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\Backup\TrainingDB_Log.trn' 
WITH RECOVERY; 

--==============================Step 3: Verify the Restored Data  =====================================
USE TrainingDB; 
SELECT * FROM Students; 