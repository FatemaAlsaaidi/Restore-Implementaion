# Restore the Database from Backup Files
<ins> Now simulate this real-world problem: 

This afternoon, the TrainingDB system crashed. Your manager asks you to recover the 
database up to the last transaction log backup you made. Your goal is to bring the database 
back to the most recent state — using your backup files only.

### Step 1: Drop the Current Database (Simulate System Failure) 
```sql
drop database TrainingDB;
```