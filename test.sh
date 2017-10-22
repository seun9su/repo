#!/bin/sh
# Use: mpstat, tail, awk, echo, date, iostat
# 사용처: CPU 부하를 정기적으로 감시해서 idle 값이 낮아지면 경고를 출력하고 싶을 때
# 실행 예제
# ./cpu-idlecheck.sh

idle_limit=10.0

## Average value in linux
cpu_idle=$(mpstat 1 5 | tail -n 1 | awk '{print $NF}')
## NF - Last Column
## FreeBSD
# cpu_idle=$$(iostat 1 6 | awk 'NR >= 4 {sum += $NF} END{print sum/5.0}')
## Mac
# cpu_idle=$(iostat 1 6 | awk 'NR >= 4 {sum += $(NF-3)} END{print sum/5.0}')
# is_alert=$(echo "$cpu_idle < $idle_limit" | bc)

## integer for expr
## float for bc
if [ "$is_alert" -eq 1 ]; then
  date_str=$(date '+%Y/%m/%d %H:%M:%S')
  echo "[$date_str] CPU %idle Alert: $cpu_idle (%)"
  # ./alert.sh
fi
