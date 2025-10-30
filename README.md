# Docker Compose Aliases for Bash

A convenient collection of Docker Compose aliases for your bash shell. Save time and keystrokes with these short, memorable aliases for common Docker Compose commands.

## Quick Install

Install the aliases with a single command:

```bash
curl -sSL https://raw.githubusercontent.com/shanujha/docker-aliases-bash/main/install.sh | bash
```

After installation, restart your terminal or run:
```bash
source ~/.bashrc
```

## What It Does

The installer will:
- Add useful Docker Compose aliases to `~/.bash_aliases`
- Ensure your `~/.bashrc` sources the aliases file
- Back up your existing `~/.bash_aliases` if it exists
- Print a success message with next steps

## Available Aliases

### Basic Commands
| Alias | Command | Description |
|-------|---------|-------------|
| `dcu` | `docker compose up` | Start services |
| `dcud` | `docker compose up -d` | Start services in detached mode |
| `dcd` | `docker compose down` | Stop and remove containers |
| `dcr` | `docker compose restart` | Restart services |
| `dcs` | `docker compose start` | Start existing containers |
| `dcst` | `docker compose stop` | Stop services without removing |
| `dcp` | `docker compose pause` | Pause services |
| `dcup` | `docker compose unpause` | Unpause services |

### Build & Pull
| Alias | Command | Description |
|-------|---------|-------------|
| `dcb` | `docker compose build` | Build or rebuild services |
| `dcbn` | `docker compose build --no-cache` | Build without cache |
| `dcpl` | `docker compose pull` | Pull service images |
| `dcpush` | `docker compose push` | Push service images |

### Logs & Status
| Alias | Command | Description |
|-------|---------|-------------|
| `dcl` | `docker compose logs` | View output from containers |
| `dclf` | `docker compose logs -f` | Follow log output |
| `dclt` | `docker compose logs --tail=100` | View last 100 lines |
| `dcps` | `docker compose ps` | List containers |
| `dctop` | `docker compose top` | Display running processes |

### Execution
| Alias | Command | Description |
|-------|---------|-------------|
| `dce` | `docker compose exec` | Execute command in running container |
| `dcrun` | `docker compose run` | Run a one-off command |
| `dcrunrm` | `docker compose run --rm` | Run command and remove container |

### Config & Validation
| Alias | Command | Description |
|-------|---------|-------------|
| `dcconfig` | `docker compose config` | Validate and view configuration |
| `dcv` | `docker compose version` | Show version information |

### Cleanup
| Alias | Command | Description |
|-------|---------|-------------|
| `dcrm` | `docker compose rm` | Remove stopped containers |
| `dcrmf` | `docker compose rm -f` | Force remove containers |
| `dcdown-v` | `docker compose down -v` | Stop and remove volumes |
| `dcdown-rmi` | `docker compose down --rmi all` | Stop and remove images |

### Combined Operations
| Alias | Command | Description |
|-------|---------|-------------|
| `dcupb` | `docker compose up --build` | Build and start services |
| `dcupd-build` | `docker compose up -d --build` | Build and start in detached mode |
| `dcrestart` | `docker compose down && docker compose up -d` | Full restart |

## Usage Examples

```bash
# Start services in detached mode
dcud

# View logs in real-time
dclf

# Execute bash in a running container
dce web bash

# Rebuild and restart services
dcupd-build

# Stop services and remove volumes
dcdown-v

# View container status
dcps
```

## Manual Installation

If you prefer not to use the curl installer, you can manually add the aliases:

1. Clone this repository:
   ```bash
   git clone https://github.com/shanujha/docker-aliases-bash.git
   cd docker-aliases-bash
   ```

2. Run the install script:
   ```bash
   ./install.sh
   ```

3. Reload your bash configuration:
   ```bash
   source ~/.bashrc
   ```

## Listing All Aliases

To see all Docker Compose aliases currently active in your shell:

```bash
alias | grep dc
```

## Uninstallation

To remove the aliases, edit `~/.bash_aliases` and delete the Docker Compose aliases section added by this installer.

## Requirements

- Bash shell
- Docker with Compose plugin (v2+) or docker-compose standalone

## Contributing

Contributions are welcome! If you have suggestions for additional useful aliases, please open an issue or submit a pull request.

## License

MIT License - feel free to use and modify as needed.

## About

This project provides a curated set of Docker Compose aliases to improve your command-line productivity when working with Docker Compose projects.
