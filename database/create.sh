#!/bin/bash

PGPASSWORD='postgres1'
DATABASE='tenmo'
USER='postgres'
SQL_FILE='tenmo.sql'
BASEDIR=$(dirname $0)

# Drop the database if it exists, then create a new one
echo "Dropping and creating the $DATABASE database..."
psql -U $USER -c "DROP DATABASE IF EXISTS $DATABASE;" &&
createdb -U $USER $DATABASE &&

# Run the SQL file to populate the database
echo "Running SQL file: $SQL_FILE"
psql -U $USER -d $DATABASE -f "$BASEDIR/$SQL_FILE"

echo "Database setup completed."
