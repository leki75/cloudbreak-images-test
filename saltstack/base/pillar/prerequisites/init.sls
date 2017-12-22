os_user: {{ salt['environ.get']('OS_USER') }}
docker: {{ grains['virtual_subtype'] | default('') in ['Docker', 'Xen PV DomU'] }}
