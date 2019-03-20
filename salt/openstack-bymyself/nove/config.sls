/etc/nova:
  file.recurse:
    - source: salt://openstack/nova/files/config
    - user: nova
    - group: nova
    - template: jinja
    - defaults:
      MYSQL_SERVER: {{ pillar['MYSQL_SERVER'] }}
      NOVA_IP: {{ pillar['NOVA_IP'] }}
      NOVA_DB_PASS: {{ pillar['NOVA_DB_PASS'] }}
      NOVA_DB_USER: {{ pillar['NOVA_DB_USER'] }}
      NOVA_DB_NAME: {{ pillar['NOVA_DB_NAME'] }}
      RABBITMQ_HOST: {{ pillar['RABBITMQ_HOST'] }}
      RABBITMQ_PORT: {{ pillar['RABBITMQ_PORT'] }}
      RABBITMQ_USER: {{ pillar['RABBITMQ_USER'] }}
      RABBITMQ_PASS: {{ pillar['RABBITMQ_PASS'] }}
      AUTH_KEYSTONE_HOST: {{ pillar['AUTH_KEYSTONE_HOST'] }}
      AUTH_KEYSTONE_PORT: {{ pillar['AUTH_KEYSTONE_PORT'] }}
      AUTH_KEYSTONE_PROTOCOL: {{ pillar['AUTH_KEYSTONE_PROTOCOL'] }}
      AUTH_NOVA_ADMIN_TENANT: {{ pillar['AUTH_NOVA_ADMIN_TENANT'] }}
      AUTH_NOVA_ADMIN_USER: {{ pillar['AUTH_NOVA_ADMIN_USER'] }}
      AUTH_NOVA_ADMIN_PASS: {{ pillar['AUTH_NOVA_ADMIN_PASS'] }}
      NEUTRON_URL: {{ pillar['NEUTRON_URL'] }}
      NEUTRON_ADMIN_USER: {{ pillar['NEUTRON_ADMIN_USER'] }}
      NEUTRON_ADMIN_PASS: {{ pillar['NEUTRON_ADMIN_PASS'] }}
      NEUTRON_ADMIN_TENANT: {{ pillar['NEUTRON_ADMIN_TENANT'] }}
      NEUTRON_ADMIN_AUTH_URL: {{ pillar['NEUTRON_ADMIN_AUTH_URL'] }}
      NOVNCPROXY_BASE_URL: {{ pillar['NOVNCPROXY_BASE_URL'] }}
      VNCSERVER_PROXYCLIENT: {{ grains['fqdn'] }}
      AUTH_URI: {{ pillar['AUTH_URI'] }}
