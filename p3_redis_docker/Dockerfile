FROM redis:5.0

WORKDIR /
COPY redis.conf redis.conf
COPY start_redis.sh start_redis.sh
RUN "chmod 744 start_redis.sh"
CMD "/bin/bash && redis-server redis.conf"

