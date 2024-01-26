# Define color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

if [ $# -ne 1 ]; then
    echo -e "${RED}Usage: $0 <stage_name>${NC}"
    exit 1
fi

dir_name="$1"

input_spl_dir="$HOME/myexpos/spl/spl_progs/$dir_name"

echo -e "${GREEN}[+] Compiling SPL files...${NC}"

if [ ! -d "$input_spl_dir" ]; then
    echo -e "${RED}[-] No SPL files found to compile"${NC}
    exit 1
fi

# Compile individual SPL files
for file in "$input_spl_dir"/*.spl; do
    echo -e "${NC}[+] Compiling $file${NC}"
    filename=$(basename "$file")
    "$HOME/myexpos/spl/spl" "$file"
done
echo -e "${GREEN}[+] Compiled all SPL files${NC}"
