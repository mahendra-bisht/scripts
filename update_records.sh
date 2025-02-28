# Below shell script will perform MySQL update operations and logs the before and after values to verify the update

#!/bin/bash

# MySQL credentials
MYSQL_USER="xxxx"
MYSQL_PASSWORD="xxxx"
MYSQL_DATABASE="xxxx"
MYSQL_HOST="xxxx/localhost"  # Since localhost doesn't have Update access

# Log file location
LOG_FILE="/home/devops/mysql_update.log"

# Current timestamp
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

# Execute first SELECT query and store values
BEFORE_VALUE=$(mysql -u $MYSQL_USER -p$MYSQL_PASSWORD -h $MYSQL_HOST $MYSQL_DATABASE -se "select Margin, LastUpdateBy from Gadget WHERE ID=2510;")

# Log before value
echo "[$TIMESTAMP] BEFORE UPDATE: $BEFORE_VALUE" >> $LOG_FILE

# Execute UPDATE query
mysql -u $MYSQL_USER -p$MYSQL_PASSWORD -h $MYSQL_HOST $MYSQL_DATABASE -e "UPDATE Gadget SET Margin='0.35',LastUpdateBy=15560 WHERE ID=2510;"

# Execute third SELECT query and store values
AFTER_VALUE=$(mysql -u $MYSQL_USER -p$MYSQL_PASSWORD -h $MYSQL_HOST $MYSQL_DATABASE -se "select Margin, LastUpdateBy from Licensee WHERE ID=2510;")

# Log after value
echo "[$TIMESTAMP] AFTER UPDATE: $AFTER_VALUE" >> $LOG_FILE

# Validate if the update worked
if [ "$BEFORE_VALUE" != "$AFTER_VALUE" ]; then
    echo "[$TIMESTAMP] UPDATE SUCCESSFUL" >> $LOG_FILE
else
    echo "[$TIMESTAMP] UPDATE FAILED" >> $LOG_FILE
fi