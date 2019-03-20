for((i=0;i<3;i++)); 
do /usr/local/bin/redis-server /usr/local/redis/redis-cluster/700$i/redis.conf; 
done
