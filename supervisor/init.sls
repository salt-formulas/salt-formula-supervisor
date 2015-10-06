
{%- if pillar.supervisor.server is defined %}
include:
- supervisor.server
{%- endif %}
