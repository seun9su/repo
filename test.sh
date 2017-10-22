commname="/usr/sbin/httpd"
## Linux
start="service httpd start"
# Mac/FreeBSD
start="/usr/sbin/apachectl start"
# 감시 대상 명령어 프로세스 수 카운트
count=$(ps ax -o command | grep "$commname" | grep -v "^grep" | wc -l)
if [ "$count" -eq 0 ]; then
  date_str=$(date '+%Y/%m/%d %H:%M:%S')
  echo "[$date_str] Can't find process $commname." >&2
  echo "[$date_str] Execute process $commname." >&2
  $start
fi
