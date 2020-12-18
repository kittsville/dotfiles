alias clearColours="tput init"
alias please="sudo"
alias dockerWipe="docker rm -v $(docker stop $(docker ps -q))"
alias whatIsMyIpAddress="curl ifconfig.me"
alias treeSummary="tree --dirsfirst -L 3 --filelimit=20"

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
