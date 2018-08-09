#!/bin/bash
# mode: Shell-script; tab-width: 2 -*-
set -ue
PROGRAM_NAME=$(basename $0 ".sh")

#==================================================================================
source_dir=/work/se/oscar08/.emacs.d
targets=""
# targets="bgegten:work/ bgegone:work/ bgeguno:work/ bvkaone:work/ bvkauno:work/"
# targets="bgegten:work/ bgeguno:work/ bvkaone:work/ bvkauno:work/"

### sptest PikaOS7
for h in bvgm03786 bvgm03727 bvgm03728 bvgm03729 bvgm03733 bvgm03734 bvgm03735; do
  for u in root bazar1084; do
    targets="$targets $u@$h:"
  done
done
#==================================================================================

usage() {
  echo "$0: hogehoge."
  echo ""
  echo "Usage: $0 [OPTION]"
  echo "Options"
  echo " -f               do process"
  echo " -n               do rsync in dry_run mode"
  echo " -v               verbose output"
  echo " -q               quiet output"
  echo " -h,(other)       show this help"
  exit 1
}

do_rsync() {
  local rsync_opts="-avuz --no-owner --no-group --exclude-from=10_rsync_exclude.txt"
  local cmd
  local rc

  if [ $opt_delete -ne 0 ]; then
    echo "==> delete option set"
    rsync_opts="--delete $rsync_opts"
  fi
  if [ $opt_rsync_dry_run -ne 0 ]; then
    echo "==> rsync_dry_run option set"
    rsync_opts="-n $rsync_opts"
  fi

  cmd="rsync $rsync_opts $@"  
  if [ $opt_run -eq 0 ]; then
    echo "(DRY_RUN): $cmd"
    return 0
  fi
  if [ $opt_quiet -ne 0 ]; then
    echo "==> do_rsync quiet: $cmd"
    $cmd >> "${PROGRAM_NAME}.log"
    rc=$?
    echo "==> do_rsync rc [$rc]"
  else
    echo "=================================="
    echo "==> $cmd"
    echo "=================================="
    $cmd
    rc=$?
    echo "==> do_rsync rc [$rc]"
  fi
  echo ""
  return $rc
}

ask_continue() {
  local msg=${1:-}
  echo $msg
  echo "==> continne? (y/N)"
  read answer
  case $answer in
    y|Y|yes)
      echo "==> Yes. proceeding..."
      ;;
    *)
      echo "==> No or other..."
      return 1
      ;;
  esac
  return 0
}

check_root() {
  local user=$( echo $1| sed 's/@.*//' )
  if [ $user != "root" ]; then
    ask_continue "==> WARNING: Not root. Maybe root requierd."
    [ $? -ne 0 ] && echo "==> exit..." && exit 1
  fi
}

do_rsync_target() {
  local arg=${1:-}
  local target
  case $arg in
  *:*|*:)
    target=$arg
    ;;
  *)
    target=${arg}:
    ;;
  esac

  echo "==> do_rsync_target: [$target]"
  do_rsync ${source_dir} ${target}
}

do_automatic() {
  local rc=0
  case $HOSTNAME in
    bgegone|bgeg75010|splunkaccess|relay-gw)
      echo "==> running on relay-gw or other: rsync local to speedtest clients..."
      echo "==> targets: $targets"
      for target in $targets; do
#	check_root $target
	do_rsync_target ${target}
	rc=$?
	if [ $rc -ne 0 ]; then
	  ask_continue "==> ERROR?"
	  [ $? -ne 0 ] && echo "==> exit..." && exit 1
	fi
	echo ""
      done
      ;;
    bv*)
      echo "not implemented..." && exit 2
      # echo "==> running on speedtestXX: rsync local to relay-gw..."
      # do_rsync ~/bin ~/sptest ~/.bashrc relay-gw:sp_backup/$HOSTNAME_save/
      ;;
    *)
      echo "ERROR: unkown host."
      exit 2
      ;;
  esac
}

opt_rsync_dry_run=0
opt_run=0
opt_delete=0
opt_verbose=0; opt_quiet=0
while getopts fndhqv OPT; do
  case $OPT in
    n) opt_rsync_dry_run=1;;
    f) opt_run=1;;
    d) opt_delete=1;;
    v) opt_verbose=1;;
    q) opt_quiet=1;;
    h|*) usage;;
  esac
done
shift $((OPTIND - 1))
# [ $# -eq 0 ] && usage

#--------

if [ "${1:-}" == "" ]; then
  do_automatic
else
  target=$(echo $1|sed -r -e 's/:$//')

  do_rsync_target ${target}
  rc=$?

  if [ $rc -ne 0 ]; then
    ask_continue "==> ERROR?"
    [ $? -ne 0 ] && echo "==> exit..." && exit 1
  fi
  echo ""
fi
