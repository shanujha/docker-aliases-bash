#!/bin/bash
# Docker Compose Aliases Installer
# Usage: curl -sSL https://raw.githubusercontent.com/shanujha/docker-aliases-bash/main/install.sh | bash

set -e

BASH_ALIASES_FILE="$HOME/.bash_aliases"
BASHRC_FILE="$HOME/.bashrc"

echo "========================================"
echo "Docker Compose Aliases Installer"
echo "========================================"
echo ""

# Create or append to ~/.bash_aliases
echo "Setting up Docker Compose aliases in $BASH_ALIASES_FILE..."

# Create HOME directory if it doesn't exist (edge case)
mkdir -p "$HOME"

# Backup existing file if it exists
if [ -f "$BASH_ALIASES_FILE" ]; then
    BACKUP_FILE="${BASH_ALIASES_FILE}.backup.$(date +%Y%m%d%H%M%S)"
    cp "$BASH_ALIASES_FILE" "$BACKUP_FILE"
    echo "Backed up existing aliases to $BACKUP_FILE"
fi

# Docker Compose aliases to add
cat >> "$BASH_ALIASES_FILE" << 'EOF'

# Docker Compose Aliases (added by docker-aliases-bash installer)
# Basic Docker Compose Commands
alias dcu='docker compose up'
alias dcud='docker compose up -d'
alias dcd='docker compose down'
alias dcr='docker compose restart'
alias dcs='docker compose start'
alias dcst='docker compose stop'
alias dcp='docker compose pause'
alias dcup='docker compose unpause'

# Docker Compose Build & Pull
alias dcb='docker compose build'
alias dcbn='docker compose build --no-cache'
alias dcpl='docker compose pull'
alias dcpush='docker compose push'

# Docker Compose Logs & Status
alias dcl='docker compose logs'
alias dclf='docker compose logs -f'
alias dclt='docker compose logs --tail=100'
alias dcps='docker compose ps'
alias dctop='docker compose top'

# Docker Compose Execution
alias dce='docker compose exec'
alias dcrun='docker compose run'
alias dcrunrm='docker compose run --rm'

# Docker Compose Config & Validation
alias dcconfig='docker compose config'
alias dcv='docker compose version'

# Docker Compose Cleanup
alias dcrm='docker compose rm'
alias dcrmf='docker compose rm -f'
alias dcdown-v='docker compose down -v'
alias dcdown-rmi='docker compose down --rmi all'

# Combined Operations
alias dcupb='docker compose up --build'
alias dcupd-build='docker compose up -d --build'
alias dcrestart='docker compose down; docker compose up -d'

EOF

echo "✓ Docker Compose aliases added to $BASH_ALIASES_FILE"
echo ""

# Ensure ~/.bashrc sources ~/.bash_aliases
echo "Checking if $BASHRC_FILE sources $BASH_ALIASES_FILE..."

# Check if bashrc exists, create if not
if [ ! -f "$BASHRC_FILE" ]; then
    touch "$BASHRC_FILE"
    echo "Created $BASHRC_FILE"
fi

# Check if bashrc already sources bash_aliases
if grep -q "\.bash_aliases" "$BASHRC_FILE"; then
    echo "✓ $BASHRC_FILE already sources $BASH_ALIASES_FILE"
else
    echo "Adding source command to $BASHRC_FILE..."
    cat >> "$BASHRC_FILE" << 'EOF'

# Load bash aliases if file exists
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
EOF
    echo "✓ Added source command to $BASHRC_FILE"
fi

echo ""
echo "========================================"
echo "Installation Complete! ✓"
echo "========================================"
echo ""
echo "Docker Compose aliases have been installed successfully!"
echo ""
echo "To start using the aliases, either:"
echo "  1. Restart your terminal, OR"
echo "  2. Run: source ~/.bashrc"
echo ""
echo "Available aliases include:"
echo "  dcu    - docker compose up"
echo "  dcud   - docker compose up -d"
echo "  dcd    - docker compose down"
echo "  dcl    - docker compose logs"
echo "  dcps   - docker compose ps"
echo "  ...and many more!"
echo ""
echo "Run 'alias | grep dc' to see all Docker Compose aliases."
