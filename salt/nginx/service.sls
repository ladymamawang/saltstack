{% set NGINXDIR='/usr/local/nginx' %}
include:
  - nginx.init
nginx-config:
  file.managed:
    - name: {{ NGINXDIR }}/conf/nginx.conf
    - source: salt://nginx/files/nginx.conf
nginx-service:
  file.managed:
    - name: /usr/lib/systemd/system/nginx.service
    - source: salt://nginx/files/nginx.service
    - user: root
    - group: root
    - mode: 755
  cmd.run:
    - name: systemctl daemon-reload
    - require:
      - file: nginx-config
nginx-start:
  service.running:
    - name: nginx
    - enable: True
    - reload: True
    - require:
      - file: nginx-service
    - watch:
      - file: /usr/local/nginx/conf/nginx.conf
      - file: nginx-config
~                                      
