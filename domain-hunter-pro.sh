#!/usr/bin/env bash
# ============================================================
# DomainHunter Pro (Starter Edition)
# Author : Debashish Bordoloi
# GitHub : https://github.com/d43ash1sh
# Website: https://d43ash1sh.github.io
# LinkedIn: https://linkedin.com/in/debashishbordoloi
# Instagram: @debashishbordoloi007
# X: @d43a_io
# ============================================================

set -euo pipefail

GREEN='\033[0;32m'
RED='\033[0;31m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m'

banner() {
clear
cat <<'EOF'
╔══════════════════════════════════════════════════════════════╗
║                  DOMAIN HUNTER PRO                          ║
║              RDAP + WHOIS Availability Check                ║
╠══════════════════════════════════════════════════════════════╣
║ GitHub   : https://github.com/d43ash1sh                     ║
║ Website  : https://d43ash1sh.github.io                      ║
║ LinkedIn : https://linkedin.com/in/debashishbordoloi        ║
║ Instagram: @debashishbordoloi007                            ║
║ X        : @d43a_io                                         ║
╚══════════════════════════════════════════════════════════════╝
EOF
}

check_domain() {
    local domain="$1"

    if command -v curl >/dev/null 2>&1; then
        local rdap
        rdap=$(curl -fsSL --max-time 10 "https://rdap.org/domain/${domain}" 2>/dev/null || true)
        if echo "$rdap" | grep -q '"errorCode":[[:space:]]*404'; then
            printf "${GREEN}✔ %-35s AVAILABLE (RDAP)${NC}\n" "$domain"
            return
        elif [[ -n "$rdap" ]]; then
            printf "${RED}✖ %-35s REGISTERED (RDAP)${NC}\n" "$domain"
            return
        fi
    fi

    if command -v whois >/dev/null 2>&1; then
        local out
        out=$(whois "$domain" 2>/dev/null || true)
        if echo "$out" | grep -qiE "No match|NOT FOUND|No Data Found|Status:[[:space:]]*free"; then
            printf "${GREEN}✔ %-35s AVAILABLE (WHOIS)${NC}\n" "$domain"
        else
            printf "${RED}✖ %-35s REGISTERED / UNKNOWN${NC}\n" "$domain"
        fi
    else
        echo -e "${YELLOW}whois is not installed.${NC}"
    fi
}

banner

read -rp "Enter brand/domain (without TLD): " base

tlds=(
com net org io dev app tech xyz site online co in co.in agency ai cloud live
)

echo
echo -e "${CYAN}Checking domains...${NC}"
echo

for tld in "${tlds[@]}"; do
    check_domain "${base}.${tld}"
done

echo
echo -e "${CYAN}Done.${NC}"
