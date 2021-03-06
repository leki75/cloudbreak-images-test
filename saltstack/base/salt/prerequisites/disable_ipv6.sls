net.ipv6.conf.default.disable_ipv6:
  sysctl.present:
    - value: 1

net.ipv6.conf.all.disable_ipv6:
  sysctl.present:
    - value: 1

net.ipv6.conf.lo.disable_ipv6:
  sysctl.present:
    - value: 1

# TODO (leki75): On newer OSes (like Ubuntu Xenial) the naming of devices
# is consistent and do not use ethX.
# https://www.freedesktop.org/wiki/Software/systemd/PredictableNetworkInterfaceNames/
#net.ipv6.conf.eth0.disable_ipv6:
#  sysctl.present:
#    - value: 1

{% if grains['os_family'] == 'RedHat' %}
/etc/sysconfig/network:
  file.replace:
    - name: /etc/sysconfig/network
    - pattern: "^NETWORKING_IPV6.*"
    - repl: "NETWORKING_IPV6=\"no\""
    - append_if_not_found: True

/etc/sysconfig/network-scripts/ifcfg-eth0:
  file.replace:
    - name: /etc/sysconfig/network-scripts/ifcfg-eth0
    - pattern: "^IPV6INIT.*"
    - repl: "IPV6INIT=\"no\""
    - append_if_not_found: True

{% endif %}
