# 🚀 DevOps & Linux CLI Automation Toolkit

[![Bash](https://img.shields.io/badge/Language-Bash%20%2F%20Shell-4EAA25?logo=gnu-bash&logoColor=white)](https://www.gnu.org/software/bash/)
[![Linux](https://img.shields.io/badge/Platform-Ubuntu%20%7C%20Debian%20%7C%20Linux-FCC624?logo=linux&logoColor=black)](https://ubuntu.com)
[![Docker](https://img.shields.io/badge/Containers-Docker%20%26%20Compose-2496ED?logo=docker&logoColor=white)](https://www.docker.com/)
[![Python](https://img.shields.io/badge/Backend-Django%205%20%7C%20FastAPI-3776AB?logo=python&logoColor=white)](https://www.python.org/)

Production-grade shell automation scripts, developer CLI utilities, and administrative cheat-sheets for Linux servers and development machines.

> [!TIP]
> **Zero Installation Required:** You can run any script below directly on any server using `curl` and `bash` without cloning the repository!

---

## ⚡ Master Quick-Run Reference (Direct Curl One-Liners)

| Tool | Category | Quick One-Liner (Run via GitHub) | Key Attributes & Arguments |
| :--- | :--- | :--- | :--- |
| **[`djinit`](#1-djinit--djangosetupsh)** | Django / Docker | `bash <(curl -fsSL https://raw.githubusercontent.com/mizan92782/CLI-Script/main/djinit) [project_name]` | `[project_name]` (e.g. `my_api_service`) |
| **[`djn`](#2-djn-django-cli-helper)** | Django CLI | `bash <(curl -fsSL https://raw.githubusercontent.com/mizan92782/CLI-Script/main/djn) [command]` | `runserver`, `mig`, `resetmig`, `resetall`, `superuser`, `app`, `shell` |
| **[`fapi`](#4-fapi-fastapi-cli-helper)** | FastAPI / Aerich | `bash <(curl -fsSL https://raw.githubusercontent.com/mizan92782/CLI-Script/main/fapi) [command]` | `run [port]`, `prod [port]`, `migrate`, `init-db`, `upgrade` |
| **[`dock`](#6-dock-docker-manager)** | Docker CLI | `bash <(curl -fsSL https://raw.githubusercontent.com/mizan92782/CLI-Script/main/dock) [command]` | `ps`, `run`, `runhost`, `exec`, `logs`, `stats`, `compose`, `install` |
| **[`docker_reinstall`](#7-dockerreinstall)** | Docker Engine | `bash <(curl -fsSL https://raw.githubusercontent.com/mizan92782/CLI-Script/main/docker_reinstall)` | *None (Automated CE + Compose installer)* |
| **[`pgsql`](#9-pgsql-postgresql-manager)** | PostgreSQL | `bash <(curl -fsSL https://raw.githubusercontent.com/mizan92782/CLI-Script/main/pgsql)` | *None (Interactive menu 1-14)* |
| **[`gitinit`](#10-gitinit)** | Git Automation | `bash <(curl -fsSL https://raw.githubusercontent.com/mizan92782/CLI-Script/main/gitinit)` | *None (Interactive initialization)* |
| **[`gitpush`](#11-gitpush)** | Git Automation | `bash <(curl -fsSL https://raw.githubusercontent.com/mizan92782/CLI-Script/main/gitpush)` | *None (Interactive commit & push)* |
| **[`syshelp`](#12-syshelp-system-navigator)** | Cheat Sheets | `bash <(curl -fsSL https://raw.githubusercontent.com/mizan92782/CLI-Script/main/syshelp) [topic]` | `docker`, `net`, `port`, `ps`, `pkg`, `perm`, `sys`, `user`, `file` |
| **[`update`](#14-update)** | System Maintenance | `bash <(curl -fsSL https://raw.githubusercontent.com/mizan92782/CLI-Script/main/update)` | *None (Apt update, upgrade & autoremove)* |
| **[`bsp`](#15-bsp)** | Utilities | `bash <(curl -fsSL https://raw.githubusercontent.com/mizan92782/CLI-Script/main/bsp) <file1> [file2...]` | `<file1> [file2...]` (Makes files executable) |
| **[`media_dl`](#16-mediadl-unified-media-downloader)** | Media Downloader | `bash <(curl -fsSL https://raw.githubusercontent.com/mizan92782/CLI-Script/main/media_dl) [options] <URL>` | `-a` (Audio MP3), `-v` (Video MP4), `-b` (Best), `-o <DIR>` |
| **[`audio`](#17-audio)** | Audio Extractor | `bash <(curl -fsSL https://raw.githubusercontent.com/mizan92782/CLI-Script/main/audio) "<URL>" [output_dir]` | `"<URL>" [output_dir]` (MP3 320kbps) |
| **[`video`](#18-video)** | Video Downloader | `bash <(curl -fsSL https://raw.githubusercontent.com/mizan92782/CLI-Script/main/video) "<URL>" [quality] [dir]` | `"<URL>" [quality: 360-1440|best] [output_dir]` |
| **[`envrn`](#3-envrn-virtual-environment-manager)** | Python venv | `bash <(curl -fsSL https://raw.githubusercontent.com/mizan92782/CLI-Script/main/envrn) [command] [name]` | `create`, `activate`, `install`, `list`, `info`, `remove` (or interactive menu) |
| **[`newmig`](#2-djn-django-cli-helper)** | Django Migrations | `bash <(curl -fsSL https://raw.githubusercontent.com/mizan92782/CLI-Script/main/newmig)` | *None (Wipes migrations & db.sqlite3)* |
| **[`dauto`](#2-djn-django-cli-helper)** | Django Reset | `bash <(curl -fsSL https://raw.githubusercontent.com/mizan92782/CLI-Script/main/dauto)` | *None (Wipes migrations, db, & rebuilds venv)* |
| **[`fastrun`](#5-fastrun--fastmig)** | FastAPI Server | `bash <(curl -fsSL https://raw.githubusercontent.com/mizan92782/CLI-Script/main/fastrun) [port]` | `[port]` (Default: 8000) |
| **[`fastmig`](#5-fastrun--fastmig)** | FastAPI Migrations | `bash <(curl -fsSL https://raw.githubusercontent.com/mizan92782/CLI-Script/main/fastmig)` | *None (Aerich migrate & upgrade)* |

---

## 📖 Detailed Tool Documentation & Attributes

### 🐍 Django & Python Automation

---

#### 1. `djinit` / `django_setup.sh`
Complete server & development automation script for Django + DRF + Docker projects.

- **GitHub Raw URL:** `https://raw.githubusercontent.com/mizan92782/CLI-Script/main/djinit`
- **One-Liner:**
  ```bash
  bash <(curl -fsSL https://raw.githubusercontent.com/mizan92782/CLI-Script/main/djinit) my_api_service
  ```
- **Attributes / Arguments:**
  - `[project_name]` *(Optional)*: Name of the Django project (e.g. `core`, `my_api`, `backend`). If omitted, prompts interactively.
- **What it does automatically:**
  1. Checks and verifies `python3`, `pip`, and `python3-venv`.
  2. Creates virtual environment `venv/` and activates it.
  3. Installs: `Django 5`, `djangorestframework`, `simplejwt`, `cors-headers`, `django-filter`, `drf-spectacular`, `psycopg2-binary`, `python-dateutil`, `pytz`, `whitenoise`, and `gunicorn`.
  4. Generates `requirements.txt`.
  5. Initializes project with root `manage.py`.
  6. Generates `.env` (with cryptographically secure randomized `SECRET_KEY`) and `.env.example`.
  7. Preconfigures `settings.py` (database connection from `.env`, CORS, Whitenoise, Swagger) and `urls.py` (`/api/docs/`, `/api/token/`).
  8. Creates `.gitignore` and `.dockerignore`.
  9. Creates `Dockerfile` (Python 3.12 slim) and `entrypoint.sh` (automatic DB readiness check, migrations, and static collection).
  10. Generates `docker-compose-dev.yml` (Hot reloading + Postgres + Redis) and `docker-compose-prod.yml` (Gunicorn + Nginx + Postgres + Redis).
  11. Creates `nginx/nginx.conf`, `./dev.sh`, and `./prod.sh` helpers.

---

#### 2. `djn` (Django CLI Helper)
Swiss Army Knife for everyday Django operations.

- **GitHub Raw URL:** `https://raw.githubusercontent.com/mizan92782/CLI-Script/main/djn`
- **One-Liner:**
  ```bash
  bash <(curl -fsSL https://raw.githubusercontent.com/mizan92782/CLI-Script/main/djn) <command> [args...]
  ```
- **Attributes / Commands:**
  | Command | Arguments | Description |
  | :--- | :--- | :--- |
  | `init` | `[name]` | Calls `djinit` to bootstrap full project |
  | `runserver`, `run` | `[port]` | Starts server (default: `0.0.0.0:8000`) |
  | `migration`, `mig` | *None* | Runs `makemigrations` followed by `migrate` |
  | `showmig` | *None* | Displays current status of all migrations |
  | `resetmig` | *None* | Deletes all migration files & SQLite database (Clean slate) |
  | `resetall` | *None* | Resets migrations, SQLite DB, and completely recreates `venv` |
  | `superuser` | *None* | Interactive prompt to create an admin superuser |
  | `shell` | *None* | Opens interactive Django Python shell |
  | `app` | `<app_name>` | Creates a new Django app |
  | `project` | `<name>` | Creates standard Django project |
  | `static` | *None* | Runs `collectstatic --noinput` |
  | `check` | *None* | Runs Django system integrity checks |
  | `test` | `[app]` | Runs Django test suite |
  | `dumpdata` | `[app] [file]` | Exports database fixtures to JSON |
  | `loaddata` | `<file.json>` | Imports database fixtures from JSON |

- **Examples:**
  ```bash
  # Start server on port 8080:
  bash <(curl -fsSL https://raw.githubusercontent.com/mizan92782/CLI-Script/main/djn) runserver 8080

  # Clean reset migrations:
  bash <(curl -fsSL https://raw.githubusercontent.com/mizan92782/CLI-Script/main/djn) resetmig
  ```

---

#### 3. `envrn` (Virtual Environment Manager)
CLI manager to create, remove, inspect, and bulk-install package groups into Python `venv`.

- **GitHub Raw URL:** `https://raw.githubusercontent.com/mizan92782/CLI-Script/main/envrn`
- **One-Liners:**
  ```bash
  # Interactive Menu:
  bash <(curl -fsSL https://raw.githubusercontent.com/mizan92782/CLI-Script/main/envrn)

  # Direct Commands:
  bash <(curl -fsSL https://raw.githubusercontent.com/mizan92782/CLI-Script/main/envrn) create [venv_name]
  bash <(curl -fsSL https://raw.githubusercontent.com/mizan92782/CLI-Script/main/envrn) install [venv_name]
  bash <(curl -fsSL https://raw.githubusercontent.com/mizan92782/CLI-Script/main/envrn) list [venv_name]
  ```
- **Attributes / Commands:**
  - *(No argument)*: Opens interactive terminal menu for all operations.
  - `create [name]`: Creates virtual environment (default: `venv`), upgrades pip, setuptools, and wheel.
  - `activate [name]`: Displays activation command or spawns an interactive subshell with active venv.
  - `install [name]`: Interactive multi-select installer for curated packages:
    - 1) Core Django (`Django`, `python-dotenv`, `psycopg2-binary`)
    - 2) REST API & JWT (`DRF`, `simplejwt`, `corsheaders`, `drf-spectacular`)
    - 3) FastAPI Stack (`fastapi`, `uvicorn`, `tortoise-orm`, `aerich`, `pydantic`)
    - 4) Async & Background Tasks (`celery`, `redis`)
    - 5) Database & Filters (`django-filter`, `django-import-export`)
    - 6) Production & Deployment (`gunicorn`, `whitenoise`)
    - 7) Dev & Debugging (`django-debug-toolbar`, `django-extensions`, `ipython`)
    - 8) Media & Storage (`Pillow`, `django-storages`)
    - 9) Complete Django Full Stack (All-in-one suite)
    - 10) Install from `requirements.txt`
  - `list [name]`: Lists installed packages via `pip list`.
  - `info [name]`: Displays `pyvenv.cfg` configuration and interpreter path.
  - `remove [name]`: Prompts and cleanly deletes the virtual environment directory.
- **Safety**: Automatically uses the venv's internal pip (`$VENV_DIR/bin/pip`), preventing `externally-managed-environment` errors on Ubuntu 24.04 and Debian 12.

---

### ⚡ FastAPI Automation

---

#### 4. `fapi` (FastAPI CLI Helper)
FastAPI developer assistant for Uvicorn servers and Tortoise-ORM / Aerich migrations.

- **GitHub Raw URL:** `https://raw.githubusercontent.com/mizan92782/CLI-Script/main/fapi`
- **One-Liner:**
  ```bash
  bash <(curl -fsSL https://raw.githubusercontent.com/mizan92782/CLI-Script/main/fapi) <command> [args...]
  ```
- **Attributes / Commands:**
  | Command | Arguments | Description |
  | :--- | :--- | :--- |
  | `run` | `[port] [app]` | Starts Uvicorn with `--reload` (default: `app.main:app`, port: 8000) |
  | `prod` | `[port] [app]` | Starts multi-worker production Uvicorn server |
  | `init-db` | *None* | Initializes Tortoise-ORM database config (`aerich init-db`) |
  | `migrate`, `mig` | *None* | Generates and applies Aerich migrations (`aerich migrate && upgrade`) |
  | `upgrade` | *None* | Applies pending migrations (`aerich upgrade`) |
  | `downgrade` | *None* | Rolls back last migration (`aerich downgrade`) |
  | `history` | *None* | Displays migration history |

- **Examples:**
  ```bash
  bash <(curl -fsSL https://raw.githubusercontent.com/mizan92782/CLI-Script/main/fapi) run 8000
  bash <(curl -fsSL https://raw.githubusercontent.com/mizan92782/CLI-Script/main/fapi) migrate
  ```

---

#### 5. `fastrun` & `fastmig`
Convenience shortcuts that delegate directly to `fapi run` and `fapi migrate`.

- **Fastrun One-Liner:**
  ```bash
  bash <(curl -fsSL https://raw.githubusercontent.com/mizan92782/CLI-Script/main/fastrun)
  ```
- **Fastmig One-Liner:**
  ```bash
  bash <(curl -fsSL https://raw.githubusercontent.com/mizan92782/CLI-Script/main/fastmig)
  ```

---

### 🐳 Docker & Container Operations

---

#### 6. `dock` (Docker Manager)
Comprehensive wrapper around Docker CLI and Docker Compose with automatic `sudo` detection.

- **GitHub Raw URL:** `https://raw.githubusercontent.com/mizan92782/CLI-Script/main/dock`
- **One-Liner:**
  ```bash
  bash <(curl -fsSL https://raw.githubusercontent.com/mizan92782/CLI-Script/main/dock) <command> [args...]
  ```
- **Attributes / Commands:**
  | Command | Arguments | Description |
  | :--- | :--- | :--- |
  | `status` | *None* | Shows Docker systemd service status |
  | `start` / `stop` / `restart` | *None* | Manages Docker system service |
  | `install` | *None* | Installs Docker CE & Docker Compose on Ubuntu/Debian |
  | `ps` | *None* | Lists currently running containers |
  | `psall` | *None* | Lists all containers including stopped |
  | `run` | `<image> [name]` | Runs container in detached background mode |
  | `runit` | `<image>` | Runs an interactive temporary container (`--rm -it`) |
  | `runhost` | `<image> [port_map]`| Runs container with port mapping (default: `8000:8000`) |
  | `exec` | `<name> [cmd]` | Executes bash/sh or command inside running container |
  | `logs` | `<name>` | Live log tail of container (`docker logs -f`) |
  | `stopc` / `startc` / `restartc` | `<name>` | Stops, starts, or restarts container |
  | `rm` | `<name>` | Force removes a container |
  | `rmi` | `<image>` | Removes a Docker image |
  | `images` | *None* | Lists downloaded images |
  | `build` | `<path> <tag>` | Builds image from Dockerfile (e.g. `dock build . myapp:v1`) |
  | `pull` / `push` | `<image>` | Pulls from or pushes to Docker Hub |
  | `stats` | *None* | Displays live CPU and memory metrics for containers |
  | `prune` | *None* | Cleans up unused containers, networks, and images |
  | `compose` | `[args...]` | Passes command to Docker Compose (e.g. `dock compose up -d`) |
  | `cheat` | *None* | Shows complete Docker cheat sheet & troubleshooting |

---

#### 7. `docker_reinstall`
Installs official Docker CE, Containerd, Docker Buildx, and Compose plugin via official Docker APT repositories, and adds `$USER` to the docker group.

- **GitHub Raw URL:** `https://raw.githubusercontent.com/mizan92782/CLI-Script/main/docker_reinstall`
- **One-Liner:**
  ```bash
  bash <(curl -fsSL https://raw.githubusercontent.com/mizan92782/CLI-Script/main/docker_reinstall)
  ```

---

#### 8. `docker_help`
Complete Docker cheat sheet and troubleshooting guide for common failures (port collisions, exited containers, socket permissions, disk exhaustion).

- **GitHub Raw URL:** `https://raw.githubusercontent.com/mizan92782/CLI-Script/main/docker_help`
- **One-Liner:**
  ```bash
  bash <(curl -fsSL https://raw.githubusercontent.com/mizan92782/CLI-Script/main/docker_help)
  ```

---

### 🐘 Database Administration

---

#### 9. `pgsql` (PostgreSQL Manager)
Interactive menu-driven PostgreSQL management tool.

- **GitHub Raw URL:** `https://raw.githubusercontent.com/mizan92782/CLI-Script/main/pgsql`
- **One-Liner:**
  ```bash
  bash <(curl -fsSL https://raw.githubusercontent.com/mizan92782/CLI-Script/main/pgsql)
  ```
- **Menu Features:**
  - `1-5`: Install, check status, start, stop, and restart PostgreSQL service.
  - `6`: Direct interactive `psql` console as user `postgres`.
  - `7-8`: List all databases (`\l`) and users (`\du`).
  - `9-11`: Create database, create user with password, grant privileges.
  - `12`: Connect to a specific database.
  - `13-14`: Automated database backup (`pg_dump`) and database restore from `.sql`.

---

### 🐙 Git Automation

---

#### 10. `gitinit`
Automates Git repository setup with best practices.

- **GitHub Raw URL:** `https://raw.githubusercontent.com/mizan92782/CLI-Script/main/gitinit`
- **One-Liner:**
  ```bash
  bash <(curl -fsSL https://raw.githubusercontent.com/mizan92782/CLI-Script/main/gitinit)
  ```
- **What it does:**
  1. Initializes repository (`git init`).
  2. Sets default branch to `main` (`git branch -M main`).
  3. Generates a standard `.gitignore` if missing.
  4. Stages all files (`git add -A`) and commits initial commit.
  5. Prompts to link remote repository URL and push to `origin/main`.

---

#### 11. `gitpush`
Fast, interactive stage, commit, and push utility.

- **GitHub Raw URL:** `https://raw.githubusercontent.com/mizan92782/CLI-Script/main/gitpush`
- **One-Liner:**
  ```bash
  bash <(curl -fsSL https://raw.githubusercontent.com/mizan92782/CLI-Script/main/gitpush)
  ```
- **Features:**
  - Displays working tree status.
  - Automatically stages modified/new files.
  - Prompt for commit message (defaults to timestamp: `'Update YYYY-MM-DD HH:MM'`).
  - Automatically detects current branch with optional branch creation.
  - Prompts before force-pushing to prevent accidental overwrites.

---

### 🐧 Linux Command Cheat Sheets & Navigator

---

#### 12. `syshelp` (System Navigator)
Master interactive hub connecting all 9 Linux cheat sheets.

- **GitHub Raw URL:** `https://raw.githubusercontent.com/mizan92782/CLI-Script/main/syshelp`
- **One-Liner:**
  ```bash
  # Interactive Menu:
  bash <(curl -fsSL https://raw.githubusercontent.com/mizan92782/CLI-Script/main/syshelp)

  # Direct Topic:
  bash <(curl -fsSL https://raw.githubusercontent.com/mizan92782/CLI-Script/main/syshelp) <topic>
  ```
- **Supported Topic Shortcuts:**
  `docker`, `net`, `port`, `ps`, `pkg`, `perm`, `sys`, `user`, `file`

---

#### 13. Individual Cheat Sheet One-Liners

| Topic | Focus | Direct Curl Execution Command |
| :--- | :--- | :--- |
| **`net_help`** | IP, Routing, DNS, Interfaces | `bash <(curl -fsSL https://raw.githubusercontent.com/mizan92782/CLI-Script/main/net_help)` |
| **`port_help`** | Listening Ports, Sockets, `ss`, `netstat`, `lsof` | `bash <(curl -fsSL https://raw.githubusercontent.com/mizan92782/CLI-Script/main/port_help)` |
| **`ps_help`** | Processes, Signals, `top`, `htop`, Kill | `bash <(curl -fsSL https://raw.githubusercontent.com/mizan92782/CLI-Script/main/ps_help)` |
| **`systemctl_help`** | Systemd, Unit Services, Logs, Timers | `bash <(curl -fsSL https://raw.githubusercontent.com/mizan92782/CLI-Script/main/systemctl_help)` |
| **`package_help`** | APT Repos, Package Updates & Cleaning | `bash <(curl -fsSL https://raw.githubusercontent.com/mizan92782/CLI-Script/main/package_help)` |
| **`permissions_help`** | `chmod`, `chown`, Octal Notation & ACLs | `bash <(curl -fsSL https://raw.githubusercontent.com/mizan92782/CLI-Script/main/permissions_help)` |
| **`file_help`** | Navigation, Tar/Gzip, Disk Usage, Find | `bash <(curl -fsSL https://raw.githubusercontent.com/mizan92782/CLI-Script/main/file_help)` |
| **`user_help`** | Users, Groups, Sudoers, Passwords | `bash <(curl -fsSL https://raw.githubusercontent.com/mizan92782/CLI-Script/main/user_help)` |

---

### 🔄 System Maintenance & Utilities

---

#### 14. `update`
Automated system maintenance tool. Updates package lists, performs full package upgrade, and cleans up obsolete dependencies and package caches.

- **GitHub Raw URL:** `https://raw.githubusercontent.com/mizan92782/CLI-Script/main/update`
- **One-Liner:**
  ```bash
  bash <(curl -fsSL https://raw.githubusercontent.com/mizan92782/CLI-Script/main/update)
  ```

---

#### 15. `bsp`
Utility to grant executable permissions (`chmod +x`) to one or more files.

- **GitHub Raw URL:** `https://raw.githubusercontent.com/mizan92782/CLI-Script/main/bsp`
- **One-Liner:**
  ```bash
  bash <(curl -fsSL https://raw.githubusercontent.com/mizan92782/CLI-Script/main/bsp) script.sh
  ```

---

### 🎬 Media Download Utilities (yt-dlp)

---

#### 16. `media_dl` (Unified Media Downloader)
Unified media downloader for YouTube and other web platforms.

- **GitHub Raw URL:** `https://raw.githubusercontent.com/mizan92782/CLI-Script/main/media_dl`
- **One-Liner:**
  ```bash
  bash <(curl -fsSL https://raw.githubusercontent.com/mizan92782/CLI-Script/main/media_dl) [options] <URL>
  ```
- **Attributes / Options:**
  - `-a`, `--audio`: Downloads highest-quality audio converted to MP3.
  - `-v`, `--video`: Downloads MP4 video (prompts for resolution: 360p - 2K).
  - `-b`, `--best`: Downloads best video+audio without prompting.
  - `-o`, `--output <DIR>`: Sets output directory (default: `~/Downloads`).
- **Examples:**
  ```bash
  # Download MP3 audio:
  bash <(curl -fsSL https://raw.githubusercontent.com/mizan92782/CLI-Script/main/media_dl) -a "https://www.youtube.com/watch?v=xxxx"

  # Download best quality video:
  bash <(curl -fsSL https://raw.githubusercontent.com/mizan92782/CLI-Script/main/media_dl) -b "https://www.youtube.com/watch?v=xxxx"
  ```

---

#### 17. `audio`
Dedicated YouTube MP3 audio extractor (320 kbps).

- **GitHub Raw URL:** `https://raw.githubusercontent.com/mizan92782/CLI-Script/main/audio`
- **One-Liner:**
  ```bash
  bash <(curl -fsSL https://raw.githubusercontent.com/mizan92782/CLI-Script/main/audio) "https://www.youtube.com/watch?v=xxxx"
  ```

---

#### 18. `video`
Dedicated YouTube MP4 video downloader with direct quality selection or interactive menu.

- **GitHub Raw URL:** `https://raw.githubusercontent.com/mizan92782/CLI-Script/main/video`
- **One-Liners:**
  ```bash
  # Interactive Quality Picker:
  bash <(curl -fsSL https://raw.githubusercontent.com/mizan92782/CLI-Script/main/video) "https://www.youtube.com/watch?v=xxxx"

  # Direct Quality (e.g. 1080p, 720p, best):
  bash <(curl -fsSL https://raw.githubusercontent.com/mizan92782/CLI-Script/main/video) "https://www.youtube.com/watch?v=xxxx" 1080
  bash <(curl -fsSL https://raw.githubusercontent.com/mizan92782/CLI-Script/main/video) "https://www.youtube.com/watch?v=xxxx" best /path/to/folder
  ```
- **Features**: Auto-checks for `yt-dlp` and `ffmpeg`, offering automated installation via `sudo apt` if missing. Merges native MP4 streams without re-encoding overhead.

---

## 💻 Optional: Install All Commands Globally on Any Server

To install all commands globally to `/usr/local/bin` so you can type `djinit`, `dock`, `djn`, `fapi`, `syshelp`, `pgsql` directly anywhere:

```bash
sudo git clone https://github.com/mizan92782/CLI-Script.git /opt/cli-script && \
sudo chmod +x /opt/cli-script/* && \
for script in /opt/cli-script/*; do
  [ -f "$script" ] && sudo ln -sf "$script" /usr/local/bin/"$(basename "$script")"
done
```

---

## 📄 License

Open-source and released under the [MIT License](https://opensource.org/licenses/MIT).
