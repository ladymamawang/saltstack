nova:
  MYSQL_SERVER: 10.148.54.41
  NOVA_IP: 10.148.54.41
  NOVA_DB_NAME: nova
  NOVA_DB_USER: nova
  NOVA_DB_PASS: nova
  DB_ALLOW: nova.*
  HOST_ALLOW: 10.148.0.0/255.255.0.0
  RABBITMQ_HOST: 10.148.54.41
  RABBITMQ_PORT: 5672
  RABBITMQ_USER: openstack 
  RABBITMQ_PASS: openstack
  AUTH_KEYSTONE_HOST: 10.148.54.41
  AUTH_KEYSTONE_PORT: 35357
  AUTH_KEYSTONE_PROTOCOL: http
  AUTH_NOVA_ADMIN_TENANT: service
  AUTH_NOVA_ADMIN_USER: nova
  AUTH_NOVA_ADMIN_PASS: nova
  GLANCE_HOST: 10.148.54.41
  AUTH_KEYSTONE_URI: http://10.148.54.41:5000
  NEUTRON_URL: http://10.148.54.41:9696
  NEUTRON_ADMIN_USER: neutron
  NEUTRON_ADMIN_PASS: neutron
  NEUTRON_ADMIN_TENANT: service
  NEUTRON_ADMIN_AUTH_URL: http://10.148.54.41:5000/v2.0
  NOVNCPROXY_BASE_URL: http://10.148.54.41:6080/vnc_auto.html
  AUTH_URI: http://10.148.54.41:5000