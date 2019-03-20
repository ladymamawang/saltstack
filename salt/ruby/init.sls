pkg-install:
  pkg.installed:
    - names:
      - zlib-devel
      - curl-devel
      - openssl-devel
      - apr-util-devel
      - apr-devel
mkdir:
  cmd.run:
    - name: mkdir -p /usr/local/ruby
pkg-get:
  file.recurse:
    - name: /usr/local/ruby
    - source: salt://ruby/files
    - require:
      - cmd: mkdir
    - user: root
    - group: root
ruby-update:
  cmd.run:
    - name: cd /usr/local/ruby && tar xf /usr/local/ruby/ruby-2.3.1.tar.gz && cd ruby-2.3.1 && ./configure && make && make install && bash
    - require:
      - file: pkg-get
rubygems-update:
  cmd.run:
    - name: cd /usr/local/ruby && tar xf rubygems-3.0.3.tgz && cd rubygems-3.0.3 && ruby setup.rb
    - require:
      - cmd: ruby-update
gem-install:
  cmd.run:
    - name: cd /usr/local/ruby && gem install redis-3.2.2.gem
    - reuqire:
      - cmd: rubygems-update 
