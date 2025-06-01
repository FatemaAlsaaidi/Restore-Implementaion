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

