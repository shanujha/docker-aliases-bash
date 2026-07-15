mkdir -p ~/.local/bin

cat > ~/.local/bin/dps <<'EOF'
#!/usr/bin/env bash

GREEN="\033[32m"
RED="\033[31m"
YELLOW="\033[33m"
RESET="\033[0m"

docker ps -a \
--format '{{.Names}}|{{.Image}}|{{.Status}}|{{.Ports}}|{{.RunningFor}}|{{.ID}}' |
awk -F'|' '
BEGIN{
printf "%-24s %-36s %-12s %-28s %-15s %-12s\n",
"🐳 CONTAINER","📦 IMAGE","🚦 STATUS","🌐 PORTS","⏱ UPTIME","📛 ID";
printf "%-24s %-36s %-12s %-28s %-15s %-12s\n",
"────────────────────────","────────────────────────────────────",
"────────────","────────────────────────────",
"───────────────","────────────";
}
{
status=$3

if(status ~ /^Up/)
    icon="🟢 Up"
else if(status ~ /Restarting/)
    icon="🟡 Restart"
else if(status ~ /Exited/)
    icon="🔴 Exited"
else
    icon="⚪ Other"

ports=$4
if(ports=="") ports="-"

printf "%-24.24s %-36.36s %-12s %-28.28s %-15.15s %-12.12s\n",
$1,$2,icon,ports,$5,$6
}
'
EOF

chmod +x ~/.local/bin/dps
