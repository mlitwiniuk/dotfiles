#!/bin/bash
# This Works is placed under the terms of the Copyright Less License,
# see file COPYRIGHT.CLL.  USE AT OWN RISK, ABSOLUTELY NO WARRANTY. 
#
# COPYRIGHT.CLL can be found at http://permalink.de/tino/cll
# (CLL is CC0 as long as not covered by any Copyright)

OOPS() { echo "OOPS: $*" >&2; exit 23; }

[ -z "`pidof openssl`" ] || OOPS "openssl running, consider: killall openssl"

PID=
kick() { [ -n "$PID" ] && kill "$PID" && sleep .2; PID=; }
trap 'kick' 0

serve()
{
kick
PID=
openssl s_server -key "$KEY" -cert "$CRT" "$@" -www &
PID=$!
sleep .5    # give it time to startup
}

check()
{
while read -r line
do
    case "$line" in
    'Verify return code: 0 (ok)')   return 0;;
    'Verify return code: '*)    return 1;;
#   *)  echo "::: $line :::";;
    esac
done < <(echo | openssl s_client -verify 8 -CApath /etc/ssl/certs/)
OOPS "Something failed, verification output not found!"
return 2
}

ARG="${1%.}"
KEY="$ARG.key"
CRT="$ARG.crt"
BND="$ARG.bundle"

for a in "$KEY" "$CRT" "$BND"
do
    [ -s "$a" ] || OOPS "missing $a"
done

serve
check && echo "!!! =========> CA-Bundle is not needed! <========"
echo
serve -CAfile "$BND"
check
ret=$?
kick

echo
case $ret in
0)  echo "EVERYTHING OK"
    echo "SSLCertificateKeyFile $KEY"
    echo "SSLCertificateFile    $CRT"
    echo "SSLCACertificateFile  $BND"
    ;;
*)  echo "!!! =========> something is wrong, verification failed! <======== ($ret)";;
esac

exit $ret