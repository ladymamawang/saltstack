{% set CACHEDIR='/var/cache/nginx' %}
include:
  - nginx.init
pkg-install:
  pkg.installed:
    - names:
      - gcc
      - gcc-c++
      - wget
      - automake
      - autoconf
      - libtool
      - libxml2-devel
      - libxslt-devel
      - perl-devel
      - perl-ExtUtils-Embed
      - pcre-devel
      - openssl
      - openssl-devel
user-add:
  cmd.run:
    - name: groupadd www && useradd -g www -s /sbin/nologin www && mkdir -p {{ CACHEDIR }} && mkdir -p {{ NGINXDIR }} && mkdir -p {{ NGINXDIR }}/conf/conf.d && mkdir -p {{ NGINXDIR }}/logs
    - unless: test -d {{ NGINXDIR }}
nginx-tar:
  file.managed:
    - name: {{ NGINXDIR }}/nginx-1.12.2.tar.gz
    - source: salt://nginx/files/nginx-1.12.2.tar.gz
  cmd.run:
    - name: cd {{ NGINXDIR }} && tar xf {{ NGINXDIR }}/nginx-1.12.2.tar.gz && cd {{ NGINXDIR }}/nginx-1.12.2 && ./configure --prefix={{ NGINXDIR }} --sbin-path={{ NGINXDIR }}/sbin/nginx --conf-path={{ NGINXDIR }}/conf/nginx.conf --error-log-path=/var/log/nginx/error.log --http-log-path=/var/log/nginx/access.log --pid-path=/var/run/nginx.pid --lock-path=/var/run/nginx.lock --http-client-body-temp-path={{ CACHEDIR }}/client_temp --http-proxy-temp-path={{ CACHEDIR }}/proxy_temp --http-fastcgi-temp-path={{ CACHEDIR }}/fastcgi_temp --http-uwsgi-temp-path={{ CACHEDIR }}/uwsgi_temp --http-scgi-temp-path={{ CACHEDIR }}/scgi_temp --user=www --group=www --with-pcre --with-http_v2_module --with-http_ssl_module --with-http_realip_module --with-http_addition_module --with-http_sub_module --with-http_dav_module --with-http_flv_module --with-http_mp4_module --with-http_gunzip_module --with-http_gzip_static_module --with-http_random_index_module --with-http_secure_link_module --with-http_stub_status_module --with-http_auth_request_module --with-mail --with-mail_ssl_module --with-file-aio --with-http_v2_module --with-threads --with-stream --with-stream_ssl_module && make && make install
    - require:
      - cmd: user-add

