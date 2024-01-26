# Define color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

if [ $# -ne 1 ]; then
    echo -e "${RED}Usage: $0 <stage_name>${NC}"
    exit 1
fi

dir_name="$1"

input_expl_dir="$HOME/myexpos/expl/expl_progs/$dir_name"

echo -e "${GREEN}[+] Compiling EXPL files...${NC}"

# Check if the input directory exists
if [ ! -d "$input_expl_dir" ]; then
    echo -e "${RED}[-] No EXPL files found to compile${NC}"
    exit 1
fi

# Compile individual EXPL files

for file in "$input_expl_dir"/*.expl; do
    echo -e "${NC}[+] Compiling $file"
    filename=$(basename "$file")
    "$HOME/myexpos/expl/expl" "$file"
done
echo -e "${GREEN}[+] Compiled all EXPL files${NC}"
