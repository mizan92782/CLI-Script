#!/bin/bash

echo "PostgreSQL Command Menu:"
echo "1) Update package list"
echo "2) Install PostgreSQL"
echo "3) Start PostgreSQL service"
echo "4) Stop PostgreSQL service"
echo "5) Restart PostgreSQL service"
echo "6) Check PostgreSQL service status"
echo "7) Switch to postgres user"
echo "8) Access PostgreSQL prompt"
echo "9) Exit PostgreSQL prompt (Only works inside psql)"
echo "10) Create a new database"
echo "11) Create a new user"
echo "12) Grant all privileges on database to user"
echo "13) List all databases"
echo "14) List all users"
echo "15) Connect to a database"
echo "16) Backup a database"
echo "17) Restore a database"
echo "18) Postgre Console"
echo "0) Exit"

read -p "Enter your choice [0-17]: " choice

case $choice in
    1)
        sudo apt update
        ;;
    2)
        sudo apt install postgresql postgresql-contrib
        ;;
    3)
        sudo systemctl start postgresql
        ;;
    4)
        sudo systemctl stop postgresql
        ;;
    5)
        sudo systemctl restart postgresql
        ;;
    6)
        sudo systemctl status postgresql
        ;;
    7)
        sudo -i -u postgres
        ;;
    8)
        sudo -i -u postgres psql
        ;;
    9)
        echo "Exit psql prompt by typing \q inside psql"
        ;;
    10)
        read -p "Enter database name to create: " dbname
        sudo -i -u postgres psql -c "CREATE DATABASE $dbname;"
        ;;
    11)
        read -p "Enter username to create: " username
        read -sp "Enter password for $username: " password
        echo
        sudo -i -u postgres psql -c "CREATE USER $username WITH PASSWORD '$password';"
        ;;
    12)
        read -p "Enter database name: " dbname
        read -p "Enter username: " username
        sudo -i -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE $dbname TO $username;"
        ;;
    13)
        sudo -i -u postgres psql -c "\l"
        ;;
    14)
        sudo -i -u postgres psql -c "\du"
        ;;
    15)
        read -p "Enter database name to connect: " dbname
        sudo -i -u postgres psql -d $dbname
        ;;
    16)
        read -p "Enter database name to backup: " dbname
        read -p "Enter backup file name (e.g. backup.sql): " filename
        pg_dump $dbname > $filename
        echo "Backup saved to $filename"
        ;;
    17)
        read -p "Enter database name to restore into: " dbname
        read -p "Enter backup file name (e.g. backup.sql): " filename
        psql $dbname < $filename
        echo "Restore complete"
        ;;
        
   18)
       sudo -u postgres psql

     ;;
    0)
        echo "Exiting."
        exit 0
        ;;
    *)
        echo "Invalid choice."
        ;;
esac
