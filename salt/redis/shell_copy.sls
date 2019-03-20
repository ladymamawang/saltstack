/root/redis-stop.sh:
  file.managed:
    - source: salt://redis/files/redis-stop.sh
    - user: root
    - group: root
/root/redis-start.sh:
  file.managed:
    - source: salt://redis/files/redis-start.sh
    - user: root
    - group: root
