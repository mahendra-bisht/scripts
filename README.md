In this repo, I will be adding script files that can used for automating various MySQL tasks.

#1 : update_records.sh : This simple script will update the record for a MySQL table and also dump the Before Update and After Update value that can be used for post verification.
Sample o/p:
cat mysql_update.log 
[2025-02-28 11:47:01] BEFORE UPDATE: 0.25       11
[2025-02-28 11:47:01] AFTER UPDATE: 0.35        12
[2025-02-28 11:47:01] UPDATE SUCCESSFUL
