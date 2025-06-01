# Restore the Database from Backup Files
<ins> Now simulate this real-world problem: 

This afternoon, the TrainingDB system crashed. Your manager asks you to recover the 
database up to the last transaction log backup you made. Your goal is to bring the database 
back to the most recent state — using your backup files only.

### Step 1: Drop the Current Database (Simulate System Failure) 
```sql
drop database TrainingDB;
```

### Step 2: Restore from Your Backups
```sql
-- 1. Restore FULL backup 
RESTORE DATABASE TrainingDB  
FROM DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\Backup\TrainingDB_Full.bak' 
WITH NORECOVERY; 

```

```
-- 2. Restore DIFFERENTIAL backup (if you created one) 
RESTORE DATABASE TrainingDB  
FROM DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\Backup\TrainingDB_Diff.bak' 
WITH NORECOVERY;
```

```
-- 3. Restore TRANSACTION LOG backup (if you created one) 
RESTORE LOG TrainingDB  
FROM DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\Backup\TrainingDB_Log.trn' 
WITH RECOVERY; 

```

### Step 3: Verify the Restored Data 
```
USE TrainingDB; 
SELECT * FROM Students; 
```

Output:
![Image of Students Table with Data](img/TestRestoreProcess.Jpg)

###### Note : studen data including the last one you added before the transaction log backup

### Reflection Questions:
1. What would happen if you skipped the differential backup step?
- If skipped the differential backup step, the database would be restored to the state of the last full backup, losing any changes made after that full backup and before the differential backup.
- This means any data added or modified after the full backup would not be present in the restored database.
- Thus, would only have the data from the full backup, which may not include the most recent transactions or changes made to the database.

2. What’s the difference between restoring a full vs. copy-only backup?

table of differences between restoring a full backup and a copy-only backup:

|Restore Type | Description|
|----------------|----------------|
|1. Full Backup | A complete backup of the database, including all data and objects. Restoring this type replaces the entire database with the state captured at the time of the backup.|
|2. Copy-Only Backup | A special type of backup that does not affect the sequence of regular backups. Restoring a copy-only backup does not require previous backups to be restored first.|