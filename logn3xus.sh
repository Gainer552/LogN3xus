#!/bin/bash

# =============================
#      COLOR DEFINITIONS
# =============================
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
MAGENTA="\e[35m"
CYAN="\e[36m"
NC="\e[0m"   # No Color

# =============================
#  OUTPUT FILE SETUP
# =============================
OUTFILE="system_logs_$(date +%Y-%m-%d_%H-%M).txt"

echo -e "${GREEN}[+] Writing results to: $OUTFILE${NC}\n"
echo "===== SYSTEM LOG COLLECTION =====" > "$OUTFILE"
echo "Generated: $(date)" >> "$OUTFILE"
echo "" >> "$OUTFILE"

# =============================
#  HELPER FUNCTION
# =============================
collect_logs () {
    SECTION_TITLE="$1"
    COLOR="$2"
    COMMAND="$3"

    echo -e "${COLOR}=============================="
    echo -e "$SECTION_TITLE"
    echo -e "==============================${NC}"

    # Display on screen
    eval "$COMMAND"

    # Append to file
    {
        echo "=============================="
        echo "$SECTION_TITLE"
        echo "=============================="
        eval "$COMMAND"
        echo ""
    } >> "$OUTFILE"
}

# =============================
#  LOG COLLECTION
# =============================

collect_logs "AUDITD LOGS (/var/log/audit/audit.log)" "$RED" \
             "sudo cat /var/log/audit/audit.log 2>/dev/null"

collect_logs "SYSTEM LOGS (/var/log/syslog or /var/log/messages)" "$GREEN" \
             "sudo cat /var/log/syslog 2>/dev/null || sudo cat /var/log/messages 2>/dev/null"

collect_logs "FIREWALL LOGS (/var/log/ufw.log)" "$YELLOW" \
             "sudo cat /var/log/ufw.log 2>/dev/null"

collect_logs "NETWORK CONNECTIONS (ss -tulnp)" "$CYAN" \
             "sudo ss -tulnp 2>/dev/null"

collect_logs "NETWORK CONNECTIONS (netstat -tulnp)" "$CYAN" \
             "sudo netstat -tulnp 2>/dev/null"

collect_logs "WEB SERVER LOGS (NGINX access.log)" "$BLUE" \
             "sudo cat /var/log/nginx/access.log 2>/dev/null"

collect_logs "CRON LOGS (/var/log/cron)" "$MAGENTA" \
             "sudo cat /var/log/cron 2>/dev/null"

collect_logs "DMESG OUTPUT" "$GREEN" \
             "sudo dmesg 2>/dev/null"

collect_logs "LSMOD OUTPUT" "$BLUE" \
             "lsmod"

collect_logs "KERNEL SYMBOL TABLE (/proc/kallsyms)" "$RED" \
             "sudo cat /proc/kallsyms 2>/dev/null"

collect_logs "SHELL HISTORY (.bash_history)" "$YELLOW" \
             "cat ~/.bash_history 2>/dev/null"

echo -e "${GREEN}[+] Log collection complete!${NC}"
echo -e "${CYAN}Saved to: $OUTFILE${NC}"
