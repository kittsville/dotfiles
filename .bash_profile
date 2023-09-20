alias clearColours="tput init"
alias please="sudo"
alias it="git"
alias whatIsMyIpAddress="curl ifconfig.me"
alias treeSummary="tree --dirsfirst -L 3 --filelimit=20"
alias uuidv4="uuidgen | tr \"[:upper:]\" \"[:lower:]\""
alias sbc="sbt --client"

function dockerWipe() {
  containerCount=$(docker ps -q | wc -l | xargs)
  if [[ $containerCount -gt 0 ]]
  then
    echo "Wiping ${containerCount} containers..."
    docker rm -v $(docker stop $(docker ps -q))
  else
    echo 'No containers are running'
  fi
}

function dlf() {
  docker logs -f "${1}"
}

# Serve pwd as website
function pServe() {
  local port="${1:-8080}"
  python -m SimpleHTTPServer "$port"
}

# Open port to public over https
function forward() {
  local port="${1:-8080}"
  ngrok http "$port"
}

# Compile and run Rust file
function rrun() {
  rustc $1.rs && ./$1
}

# Open current repo on github
function ghopen() {
  REPO="$(git remote -v | grep fetch | sed 's/origin//' | tr ':' '/' | sed 's/.*git@/http:\/\//' | sed 's/.git *([a-z]*)//')"

  os="$(uname -s)"

  case "${os}" in
    Linux*) cmd="xdg-open" ;;
    Darwin*) cmd="open" ;;
    CYGWIN*) cmd="start" ;;
    *) cmd="echo Unable to open link" ;;
  esac

  $cmd "$REPO"
}
