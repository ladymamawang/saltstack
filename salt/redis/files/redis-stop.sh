ip=`ifconfig ens192 | grep "inet 1" |awk '{print $2}'`
for((i=0;i<=2;i++));
do /usr/local/bin/redis-cli -c -h $ip -p 700$i shutdown;
done
