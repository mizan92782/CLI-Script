# 🚀 DevOps & Linux Shell Automation Toolkit

A production-grade collection of bash automation utilities, developer helpers, and administrative cheat-sheets designed for Linux servers and development environments.

---

## 📑 Table of Contents

- [Overview](#-overview)
- [Tool Categories & Inventory](#-tool-categories--inventory)
  - [1. Web Frameworks & Environments](#1-web-frameworks--environments)
  - [2. Docker & Container Operations](#2-docker--container-operations)
  - [3. Database Management](#3-database-management)
  - [4. Git & Version Control](#4-git--version-control)
  - [5. System Administration & Helper Hub](#5-system-administration--helper-hub)
  - [6. Media & Download Utilities](#6-media--download-utilities)
- [Quick Start](#-quick-start)
- [Detailed Tool Guide](#-detailed-tool-guide)
- [License](#-license)

---

## 🌟 Overview

This repository provides streamlined, automated shell scripts to simplify repetitive tasks across server deployment, local development, container orchestration, database administration, and Linux system diagnostics.

All scripts feature:
- ✅ **Argument Validation**: Safe defaults and interactive fallback prompts.
- ✅ **Color-Coded Status Output**: Clear visual feedback (info, warnings, errors).
- ✅ **Robust Error Handling**: Exit code management and system checks.
- ✅ **Non-Root & Sudo Awareness**: Auto-detects permissions to prevent unnecessary `sudo` prompts.

---

## 🛠 Tool Categories & Inventory

| Category | Scripts | Primary Function |
| :--- | :--- | :--- |
| **Django & DRF** | [`djinit`](file:///home/mizan/ShellScript/djinit), [`djn`](file:///home/mizan/ShellScript/djn), [`denv`](file:///home/mizan/ShellScript/denv), [`newmig`](file:///home/mizan/ShellScript/newmig), [`dauto`](file:///home/mizan/ShellScript/dauto) | Full project bootstrapping, venv management, migrations & dev server |
| **FastAPI** | [`fapi`](file:///home/mizan/ShellScript/fapi), [`fastrun`](file:///home/mizan/ShellScript/fastrun), [`fastmig`](file:///home/mizan/ShellScript/fastmig) | Uvicorn live server & Aerich Tortoise-ORM migration management |
| **Virtual Environments** | [`envrn`](file:///home/mizan/ShellScript/envrn) | Interactive Python virtual environment creation & package installer |
| **Docker & Compose** | [`dock`](file:///home/mizan/ShellScript/dock), [`docker_reinstall`](file:///home/mizan/ShellScript/docker_reinstall), [`docker_help`](file:///home/mizan/ShellScript/docker_help) | Container CLI helper, Docker CE installer & troubleshooting cheat sheet |
| **PostgreSQL** | [`pgsql`](file:///home/mizan/ShellScript/pgsql) | Interactive menu for database creation, users, privileges, backup & restore |
| **Git Automation** | [`gitinit`](file:///home/mizan/ShellScript/gitinit), [`gitpush`](file:///home/mizan/ShellScript/gitpush) | Zero-friction repo initialization, default branch setup, staging & push |
| **System Help Hub** | [`syshelp`](file:///home/mizan/ShellScript/syshelp) (and 8 `*_help` tools) | Interactive navigator across all Linux cheat sheets |
| **System Maintenance** | [`update`](file:///home/mizan/ShellScript/update), [`bsp`](file:///home/mizan/ShellScript/bsp) | One-line APT update/autoremove & permission granting |
| **Media Utilities** | [`media_dl`](file:///home/mizan/ShellScript/media_dl), [`audio`](file:///home/mizan/ShellScript/audio), [`video`](file:///home/mizan/ShellScript/video) | Unified audio (MP3) and video (MP4) downloader using `yt-dlp` |

---

## 🚀 Quick Start

Ensure scripts have execute permissions:
```bash
chmod +x *
```

### 1. Bootstrap a Complete Django + Docker + DRF Project
```bash
./djinit my_api_service
```
- Creates `venv/`, installs all dependencies (Django, DRF, JWT, CORS, Postgres, Whitenoise, Gunicorn).
- Generates `Dockerfile`, `docker-compose-dev.yml`, `docker-compose-prod.yml`, `.env`, and `nginx/nginx.conf`.

### 2. Manage Docker Containers Without Headaches
```bash
./dock ps                  # List running containers
./dock run nginx mynginx   # Start a container
./dock exec mynginx bash   # Interactive bash shell inside container
./dock stats               # Live CPU & memory metrics
```

### 3. PostgreSQL Database Menu
```bash
./pgsql
```
- Interactive menu to create databases, manage users, backup via `pg_dump`, and restore.

### 4. Linux Command Navigator (`syshelp`)
```bash
./syshelp          # Opens full interactive navigation menu
./syshelp net      # Shows network configuration cheat sheet
./syshelp port     # Shows port & listening socket cheat sheet
./syshelp docker   # Shows Docker cheat sheet & troubleshooting
```

---

## 📖 Detailed Tool Guide

### 1. Web Frameworks & Environments

#### `djinit` & `django_setup.sh`
Complete automation file for server & local Django development:
- Checks system prerequisites (`python3`, `pip`, `python3-venv`).
- Creates and activates virtual environment `venv/`.
- Installs Django 5, DRF, JWT, CORS headers, `python-dateutil`, `pytz`, `psycopg2-binary`, `drf-spectacular`, and `gunicorn`.
- Generates root `manage.py`, `.env` with a secure randomized `SECRET_KEY`, `.env.example`, `.gitignore`, and `.dockerignore`.
- Configures `settings.py` for `.env` integration, Whitenoise, and Swagger OpenAPI 3 docs.
- Configures `urls.py` with `/api/docs/` and `/api/token/` endpoints.
- Creates `Dockerfile`, `entrypoint.sh`, `docker-compose-dev.yml`, `docker-compose-prod.yml`, and `nginx/nginx.conf`.

#### `djn`
The everyday Django CLI assistant:
```bash
./djn runserver 8000   # Run dev server
./djn mig              # makemigrations && migrate
./djn resetmig         # Clean all migration files and reset sqlite database
./djn resetall         # Reset migrations, db, and rebuild virtual environment
./djn superuser        # Create admin user
./djn shell            # Open Django shell
./djn app <name>       # Create new Django app
```

#### `fapi`
FastAPI & Tortoise-ORM Aerich CLI manager:
```bash
./fapi run             # Start Uvicorn with auto-reload on port 8000
./fapi run 8080        # Custom port
./fapi migrate         # Generate & apply Aerich migrations
./fapi prod            # Run multi-worker production server
```

---

### 2. Docker & Container Operations

#### `dock`
An intuitive wrapper around Docker and Docker Compose:
- Auto-detects if the user is in the `docker` group to omit `sudo`.
- Commands: `status`, `start`, `stop`, `restart`, `ps`, `psall`, `run`, `runit`, `runhost`, `exec`, `logs`, `stopc`, `startc`, `rm`, `rmi`, `images`, `build`, `pull`, `push`, `stats`, `prune`, `compose`, and `cheat`.

#### `docker_reinstall`
One-command installation of official Docker CE, Containerd, and Docker Compose plugin on Ubuntu/Debian.

#### `docker_help`
Exhaustive Docker cheat sheet with a troubleshooting guide for common issues (port collisions, exited containers, permission denied, disk exhaustion).

---

### 3. Database Management

#### `pgsql`
Menu-driven PostgreSQL administrative utility:
- Service management (start, stop, restart, status).
- User & database creation with permission grants.
- Database backups (`pg_dump`) with automated timestamp naming.
- Database restore from `.sql` files.

---

### 4. Git & Version Control

#### `gitinit`
Initializes a new Git repository, sets the default branch to `main`, generates a standard `.gitignore`, stages files, and sets up the remote origin.

#### `gitpush`
Interactive Git workflow:
- Displays working tree status.
- Stages changes (`git add -A`) with automated commit message fallback.
- Auto-detects active branch with optional branch creation.
- Safe push with confirmation before force-pushing.

---

### 5. System Administration & Helper Hub

#### `syshelp`
Centralized navigator providing instant access to all 9 system cheat sheets:
- `docker_help`: Docker commands & fixes
- `file_help`: File and directory navigation, compression, and searches
- `net_help`: Network interfaces, IP addresses, DNS, and connectivity
- `port_help`: Socket listening status (`ss`, `netstat`, `lsof`, `fuser`)
- `ps_help`: Process monitoring, signals, `top`, `htop`, `kill`
- `package_help`: APT updates, upgrades, package searches, and repository management
- `permissions_help`: `chmod`, `chown`, octal permissions, and ACLs
- `systemctl_help`: Systemd services, daemon reload, failed services, and logs
- `user_help`: User accounts, groups, `sudoers`, and passwd management

#### `update`
Single-command system maintenance:
```bash
./update
```
Performs `apt update`, `apt upgrade -y`, and `apt autoremove -y`.

#### `bsp`
Quick utility to grant executable permissions to one or more scripts:
```bash
./bsp script_name.sh
./bsp *.sh
```

---

### 6. Media Utilities

#### `media_dl`
Unified media downloader for YouTube and web video platforms via `yt-dlp`:
```bash
./media_dl -a <URL>   # Download as MP3 (320kbps audio)
./media_dl -v <URL>   # Download as MP4 with quality selection (360p - 2K)
./media_dl -b <URL>   # Download best available quality directly
```
Individual standalone scripts [`audio`](file:///home/mizan/ShellScript/audio) and [`video`](file:///home/mizan/ShellScript/video) are also available.

---

## 📄 License

Open-source and available under the [MIT License](https://opensource.org/licenses/MIT).
