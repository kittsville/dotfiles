# Serve pwd as website
function pServe() {
  local port="${1:-8080}"
  python -m SimpleHTTPServer "$port"
}

# Open port to public over https
function forward() {
  local port="${1:-8080}"
  local subdomain="${2:-kittytest}"
  lt --port "$port" --subdomain "$subdomain"
}

# Compile and run Rust file
function rrun() {
  rustc $1.rs && ./$1
}
