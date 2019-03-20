{% set PROD_DIR = "7001" %}
pkg-installed:
  pkg.installed:
    - names:
      - zlib
      - ruby
      - rubygems
dir-create:
  cmd.run:
    - name: mkdir -p /usr/local/redis/redis-cluster/{{ PROD_DIR }} && mkdir -p /data/redis/logs/ 
    - unless: test -d /usr/local/redis/redis-cluster/{{ PROD_DIR }}
redis-get:
  file.managed:
    - name: /usr/local/redis/redis-cluster/{{ PROD_DIR }}/redis-3.2.12.tar.gz 
    - source: salt://redis/files/redis-3.2.12.tar.gz
    - user: root
    - group: root
    - require:
      - cmd: dir-create
conf-get:
  file.managed:
    - name: /usr/local/redis/redis-cluster/{{ PROD_DIR }}/redis.conf
    - source: salt://redis/files/redis.conf 
    - template: jinja
    - defaults:
        BIND_IPADDR: {{ grains['ip_interfaces']['ens192'][0] }} 
        PROT: {{ pillar.redis.PROT }} 
    - require:
      - cmd: dir-create
    - user: root
    - group: root
redis-install:
  cmd.run:
    - name: cd /usr/local/redis/redis-cluster/{{ PROD_DIR }} && tar xf redis-3.2.12.tar.gz && cd redis-3.2.12 && make && make install
