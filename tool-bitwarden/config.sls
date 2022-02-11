{%- from 'tool-bitwarden/map.jinja' import bitwarden -%}

include:
  - {{ slsdotpath }}.package

{%- for user in bitwarden.users | selectattr('bitwarden.config', 'defined') %}
Bitwarden configuration is synced for user '{{ user.name }}':
  file.serialize:
    - name: {{ user._bitwarden.confdir }}/data.json
    - serializer: json
    - merge_if_exists: True
    - dataset: {{ user.bitwarden.config | json }}
    - user: {{ user.name }}
    - group: {{ user.group }}
    - mode: '0600'
    - dir_mode: '0700'
    - makedirs: True
    - require:
  {%- if 'Darwin' == grains.kernel and bitwarden.macos_appstore is defined and bitwarden.macos_appstore %}
      - Bitwarden is installed for user '{{ user.name }}'
  {%- else %}
      - Bitwarden is installed
  {%- endif %}
{%- endfor %}
