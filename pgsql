#!/bin/bash

# ==============================================================================
# PostgreSQL Management & Interactive Menu CLI Tool
# ==============================================================================

CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

show_menu() {
    clear
    echo -e "${CYAN}===================================================${NC}"
    echo -e "${CYAN}        🐘 POSTGRESQL INTERACTIVE MANAGER          ${NC}"
    echo -e "${CYAN}===================================================${NC}"
    echo -e "${YELLOW}Service Operations:${NC}"
    echo "  1) Install PostgreSQL & Contrib"
    echo "  2) Check PostgreSQL Service Status"
    echo "  3) Start PostgreSQL Service"
    echo "  4) Stop PostgreSQL Service"
    echo "  5) Restart PostgreSQL Service"
    echo ""
    echo -e "${YELLOW}Database & User Administration:${NC}"
    echo "  6) Access PostgreSQL CLI (psql console)"
    echo "  7) List All Databases"
    echo "  8) List All Users"
    echo "  9) Create a New Database"
    echo " 10) Create a New User with Password"
    echo " 11) Grant All Privileges on Database to User"
    echo " 12) Connect to a Specific Database"
    echo ""
    echo -e "${YELLOW}Backup & Recovery:${NC}"
    echo " 13) Backup a Database (pg_dump)"
    echo " 14) Restore a Database"
    echo ""
    echo -e "${RED}  0) Exit${NC}"
    echo -e "${CYAN}===================================================${NC}"
}

while true; do
    show_menu
    read -p "Enter your choice [0-14]: " choice
    echo ""

    case $choice in
        1)
            echo "Installing PostgreSQL..."
            sudo apt update && sudo apt install -y postgresql postgresql-contrib
            ;;
        2)
            sudo systemctl status postgresql --no-pager
            ;;
        3)
            sudo systemctl start postgresql && echo -e "${GREEN}PostgreSQL service started.${NC}"
            ;;
        4)
            sudo systemctl stop postgresql && echo -e "${YELLOW}PostgreSQL service stopped.${NC}"
            ;;
        5)
            sudo systemctl restart postgresql && echo -e "${GREEN}PostgreSQL service restarted.${NC}"
            ;;
        6)
            echo "Entering psql console (type \q to exit)..."
            sudo -i -u postgres psql
            ;;
        7)
            sudo -i -u postgres psql -c "\l"
            ;;
        8)
            sudo -i -u postgres psql -c "\du"
            ;;
        9)
            read -p "Enter new database name: " dbname
            if [ -n "$dbname" ]; then
                sudo -i -u postgres psql -c "CREATE DATABASE \"$dbname\";"
                echo -e "${GREEN}Database '$dbname' created successfully.${NC}"
            fi
            ;;
        10)
            read -p "Enter new username: " username
            read -sp "Enter password for $username: " password
            echo ""
            if [ -n "$username" ]; then
                sudo -i -u postgres psql -c "CREATE USER \"$username\" WITH PASSWORD '$password';"
                echo -e "${GREEN}User '$username' created successfully.${NC}"
            fi
            ;;
        11)
            read -p "Enter database name: " dbname
            read -p "Enter username to grant privileges to: " username
            if [ -n "$dbname" ] && [ -n "$username" ]; then
                sudo -i -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE \"$dbname\" TO \"$username\";"
                echo -e "${GREEN}Granted all privileges on '$dbname' to '$username'.${NC}"
            fi
            ;;
        12)
            read -p "Enter database name to connect to: " dbname
            if [ -n "$dbname" ]; then
                sudo -i -u postgres psql -d "$dbname"
            fi
            ;;
        13)
            read -p "Enter database name to backup: " dbname
            read -p "Enter backup file path [default: ${dbname}_backup_$(date +%F).sql]: " filename
            filename=${filename:-"${dbname}_backup_$(date +%F).sql"}
            sudo -u postgres pg_dump "$dbname" > "$filename"
            echo -e "${GREEN}✔ Backup successfully saved to $filename${NC}"
            ;;
        14)
            read -p "Enter database name to restore into: " dbname
            read -p "Enter backup SQL file path: " filename
            if [ -f "$filename" ]; then
                sudo -u postgres psql "$dbname" < "$filename"
                echo -e "${GREEN}✔ Restore complete into $dbname!${NC}"
            else
                echo -e "${RED}Error: File '$filename' not found!${NC}"
            fi
            ;;
        0)
            echo "Exiting PostgreSQL manager. Goodbye!"
            exit 0
            ;;
        *)
            echo -e "${RED}Invalid choice! Please select 0-14.${NC}"
            ;;
    esac

    echo ""
    read -p "Press Enter to return to menu..." _
done
