{%- from 'tool-bitwarden/map.jinja' import bitwarden -%}

include:
  - tool-mas

{%- for user in bitwarden.users %}

Bitwarden is installed for user '{{ user.name }}':
  mas.installed:
    - name: "1352778147"
    - user: {{ user.name }}
    # sls: tool-mas does not work, seems like the included file needs to have some state itself
    - require:
        - mas is installed
{%- endfor %}
