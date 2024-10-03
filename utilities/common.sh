#!/bin/bash
# Text formatting
BOLD='\033[1m'
UNDERLINE='\033[4m'

# Text colors
GREEN='\033[0;32m'
NC='\033[0m' # No Color

info() {
  echo -e "${GREEN}${BOLD}$1${NC}"
}
