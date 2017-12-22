{% if not pillar['docker'] %}
/etc/hostname:
  file.absent
{% endif %}

{% if grains['os_family'] == 'RedHat' and not pillar['docker'] %}
hostname_remove:
  file.line:
    - name: /etc/sysconfig/network
    - mode: delete
    - content: "HOSTNAME="
{% endif %}
