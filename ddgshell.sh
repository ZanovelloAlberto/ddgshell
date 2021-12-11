#!/usr/bin/env bash

set -Eeuo pipefail
trap cleanup SIGINT SIGTERM ERR EXIT

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)
usage() {
  cat << EOF # remove the space between << and EOF, this is due to web plugin issue
Usage: $(basename "${BASH_SOURCE[0]}") [-h] [-v] [-f] -p param_value arg1 [arg2...]

Script description here.

Available options:

-h,     --help      []          Print this help and exit
-v,     --verbose   []          Print script debug info
-f,     --flag      []          Some flag description
-gh,    --github    [arg1]      
-p,     --param     [args...]   Some param description


EOF
  exit
}

cleanup() {
  trap - SIGINT SIGTERM ERR EXIT
  # script cleanup here
}

setup_colors() {
  if [[ -t 2 ]] && [[ -z "${NO_COLOR-}" ]] && [[ "${TERM-}" != "dumb" ]]; then
    NOFORMAT='\033[0m' RED='\033[0;31m' GREEN='\033[0;32m' ORANGE='\033[0;33m' BLUE='\033[0;34m' PURPLE='\033[0;35m' CYAN='\033[0;36m' YELLOW='\033[1;33m'
  else
    NOFORMAT='' RED='' GREEN='' ORANGE='' BLUE='' PURPLE='' CYAN='' YELLOW=''
  fi
}

msg() {
  echo >&2 -e "${1-}"
}

die() {
  local msg=$1
  local code=${2-1} # default exit status 1
  msg "$msg"
  exit "$code"
}
split_by_slash() {
  local IFS=/
  local foo
  set -f # Disable glob expansion
  foo=( $@ ) # Deliberately unquoted 
  set +f
  printf '%d\n' "${#foo[@]}"
  printf '%s\n' "${foo[@]}"
}

gh_repo_download() {

  local owner=$1
  local repo=$2
  local branch=$3 
  local path=$4
  local location=$5
  curl -o ${location} https://codeload.github.com/${owner}/${repo}/tar.gz/${branch} | \
  tar -xz --strip=2 ${repo}-${branch}/${path}
  msg "$msg"
}

parse_gh_link(){

    local link=$1
    # extract the protocol
    proto="$(echo $1 | grep :// | sed -e's,^\(.*://\).*,\1,g')"
    # remove the protocol
    url="$(echo ${1/$proto/})"
    # extract the user (if any)
    user="$(echo $url | grep @ | cut -d@ -f1)"
    # extract the host and port
    hostport="$(echo ${url/$user@/} | cut -d/ -f1)"
    # by request host without port    
    host="$(echo $hostport | sed -e 's,:.*,,g')"
    # by request - try to extract the port
    port="$(echo $hostport | sed -e 's,^.*:,:,g' -e 's,.*:\([0-9]*\).*,\1,g' -e 's,[^0-9],,g')"
    # extract the path (if any)
    path="$(echo $url | grep / | cut -d/ -f2-)"

    echo $proto
    echo $url
    echo $user
    echo $hostport
    echo $host
    echo $port
    echo $path

}

dialog_gh_repo_download(){
    local owner=$1
  local repo=$2 # default exit status 1
  local branch=$3 # default exit status 1
}



parse_params() {
  # default values of variables set from params
  flag=false
  param=''
  github_link=''

  while :; do
    case "${1-}" in
    -h | --help) usage; break;;
    -v | --verbose) set -x ;;
    --no-color) NO_COLOR=1 ;;
    -f | --flag) flag=true ;; # example flag
    # -gh | --github) 
    # param="${2-}"
    #  ;;
    -p | --param) # example named parameter
      param="${2-}"
      shift
      ;;
    -?*) die "Unknown option: $1" ;;
    *) break ;;
    esac
    shift
  done

  args=("$@")

  # check required params and arguments
  [[ -z "${param-}" ]] && die "Missing required parameter: param"
  [[ ${#args[@]} -eq 0 ]] && die "Missing script arguments"

  return 0
}


parse_params "$@"
setup_colors

# script logic here
# if [ "$github_link" != "" ];then
parse_gh_link "https://discord.com/channels/758693578121281536/888771074202939412"




msg "${RED}Read parameters:${NOFORMAT}"
msg "- flag: ${flag}"
msg "- param: ${param}"
msg "- arguments: ${args[*]-}"