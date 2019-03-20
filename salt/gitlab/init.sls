pkg-install:
  pkg.installed:
    - names:
      - curl
      - openssh-server
      - postfix
      - cronie
      - policycoreutils-python
rpm-get:
  file.managed:
    - name: /tmp/gitlab-ce-11.8.1-ce.0.el6.x86_64.rpm
    - source: salt://gitlab/files/gitlab-ce-11.8.1-ce.0.el6.x86_64.rpm
    - user: root
    - group: root
rpm-install:
  cmd.run:
    - name:
      cd /tmp && rpm -ivh gitlab-ce-11.8.1-ce.0.el6.x86_64.rpm 
gitlab-config:
  file.managed:
    - name: /etc/gitlab/gitlab.rc
    - source: salt://gitlab/files/gitlab.rc
    - user: root
    - group: root
    - template: jinja
    - defaults:
      IPADDR: {{ pillar ['gitlab']['IPADDR'] }}
    - require:
      cmd: rpm-install
gitlab-reconfigure:
  cmd.run:
    - name:
      gitlab-ctl reconfigure

