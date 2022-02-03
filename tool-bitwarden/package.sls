{%- from 'tool-bitwarden/map.jinja' import bitwarden -%}

{%- set installer_module = 'pkg' %}

{%- if 'Darwin' == grains.kernel and bitwarden.macos_appstore is defined and bitwarden.macos_appstore %}
include:
  - tool-mas

  {%- set installer_module = 'mas' %}
  {%- do bitwarden.update({'package': '1352778147'}) %}
{%- endif %}

Bitwarden is installed:
  {{ installer_module }}.installed:
    - name: "{{ bitwarden.package }}"
{%- if 'mas' == installer_module %}
    # sls: tool-mas does not work, seems like the included file needs to have some state itself
    - require:
        - mas is installed
{%- endif %}
