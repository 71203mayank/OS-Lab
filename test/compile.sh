# Define color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

if [ $# -ne 1 ]; then
    echo -e "${RED}Usage: $0 <stage_name>${NC}"
    exit 1
fi

stage_name="$1"

compile_spl="$HOME/myexpos/spl"
compile_expl="$HOME/myexpos/expl"
home="$HOME/myexpos/test"


# Compile all the files
echo "${GREEN}[+] Compiling all the required files...${NC}"
echo
cd $HOME/myexpos/spl
bash compile.sh $stage_name
cd $HOME/myexpos/expl
echo
bash compile.sh $stage_name
cd $HOME/myexpos/test
echo

echo "${GREEN}[+] Compilation complete.${NC}"
