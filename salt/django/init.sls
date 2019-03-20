include:
  - python3.init
django-install:
  cmd.run:
    - name:
       cd /usr/local/python3 && /usr/bin/pip3 install pytz-2018.4-py2.py3-none-any.whl &&tar xf Django-2.0.5.tar.gz && cd Django-2.0.5 && /usr/bin/python3 setup.py install && ln -s /usr/local/python3/bin/django-admin /usr/sbin/django-admin 
    - unless: 
       test -f /usr/sbin/django-admin
