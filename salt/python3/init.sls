pkg-get:
  pkg.installed:
    - names:
      - zlib
      - zlib-devel
      - bzip2
      - bzip2-devel
      - ncurses
      - ncurses-devel
      - readline
      - readline-devel
      - openssl
      - openssl-devel
      - openssl-static
      - xz
      - lzma
      - xz-devel
      - sqlite
      - sqlite-devel
      - gdbm
      - gdbm-devel
      - tk
      - tk-devel
      - libffi
      - libffi-devel
      - gcc
  cmd.run:
    - name: mkdir /usr/local/python3
    - unless: test -d /usr/local/python3
  file.recurse:
    - name: /usr/local/python3
    - source: salt://python3/files
    - requirt:
      - cmd: pkg-install
pkg-install:
  cmd.run:
    - name: cd /usr/local/python3 && tar xf /usr/local/python3/Python-3.7.0.tgz && cd /usr/local/python3/Python-3.7.0 &&./configure --prefix=/usr/local/python3 && make && make install && ln -s /usr/local/python3/bin/python3.7 /usr/bin/python3 &&cd /usr/local/python3 && tar -zxvf setuptools-19.6.tar.gz && cd setuptools-19.6 && python3 setup.py build && python3 setup.py install && cd /usr/local/python3 && tar -zxvf pip-8.0.2.tar.gz && cd pip-8.0.2 && python3 setup.py build && python3 setup.py install && ln -s /usr/local/python3/bin/pip3 /usr/local/bin/pip3 
    - requirt:
      - cmd: pkg-get
    - unless: test -f /usr/bin/pip3
