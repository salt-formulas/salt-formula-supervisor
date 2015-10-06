{% from "supervisor/map.jinja" import server with context %}

{%- if server.enabled %}

supervisor_packages:
  pkg.installed:
  - names: {{ server.pkgs }}

{%- if grains.os_family == 'RedHat' %}

supervisor_config:
  file.managed:
  - name: /etc/supervisord.conf
  - source: salt://supervisor/files/supervisor.conf
  - mode: 644
  - template: jinja
  - require:
    - pkg: supervisor_packages
  - watch_in:
    - service: supervisor_service

{%- else %}

{%- for service_name, service in server.get('service', {}).iteritems() %}

supervisor_config_{{ service_name }}:
  file.managed:
  - name: {{ server.config_prefix }}{{ service_name }}{{ server.config_suffix }}
  - source: salt://{{ service.type }}/files/supervisor.conf
  - mode: 644
  - template: jinja
  - defaults:
    service_name: "{{ service_name }}"
  - require:
    - pkg: supervisor_packages
  - watch_in:
    - service: supervisor_service

supervisor_service_{{ service_name }}:
  supervisord.running:
  - name: {{ service_name }}
  - conf_file: {{ server.config_prefix }}{{ service_name }}{{ server.config_suffix }}
  - update: true
  - watch:
    - file: supervisor_config_{{ service_name }}

{%- endfor %}

{%- endif %}

supervisor_service:
  service.running: 
  - name: {{ server.formula_service }}
  - enable: true
  - watch:
    - pkg: supervisor_packages

{%- endif %}
