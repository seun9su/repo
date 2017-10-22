# Use: ifconfig, awk
# 사용처: 서버 NIC와 IP 주소 목록을 표시하고 싶을 때
# 실행 예제
# ./nic-ipaddr.sh

## for Linux
# ifconfig 명령어로 유효한 인터페이스 표시
# awk 명령어로 인터페이스명과 IP 주소 추출
LANG=C /sbin/ifconfig |\
awk '/^[a-z]/ {print "[" $1 "]"}
/inet / {split($2,arr,":"); print arr[2]}'

## for Mac/FreeBSD
# LANG=C /sbin/ifconfig |\
# awk '/^[a-z]/ {print "[" $1 "]"}
# /inet / {print $2}'
