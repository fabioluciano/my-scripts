#!/usr/bin/env bash

last_pkgs() {
  grep $(date +'%Y-%m-%d') /var/log/dpkg.log | awk '$3 == "upgrade"'  | awk '{ gsub(/:[a-z0-9]+/, "", $4); printf "\033[37m%s \033[31m%s\033[32m %s\033[0m\n", $4, $5, $6 }' | sort -k1,1 --unique --stable | column -t 
}
