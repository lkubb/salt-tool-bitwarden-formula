# vim: ft=sls

{%- set tplroot = tpldir.split("/")[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as bitwarden with context %}


include:
  - tool_mas

{%- for user in bitwarden.users %}

Bitwarden is absent for user '{{ user.name }}':
  mas.absent:
    - name: '{{ bitwarden.lookup.pkg.mas_id }}'
    - user: {{ user.name }}
    # sls: tool-mas does not work, seems like the included file needs to have some state itself
    - require:
      - mas is installed
{%- endfor %}
