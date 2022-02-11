{%- from 'tool-bitwarden/map.jinja' import bitwarden -%}

{%- if 'Darwin' == grains.kernel and bitwarden.macos_appstore is defined and bitwarden.macos_appstore %}
include:
  - .mas
{%- else %}

Bitwarden is installed:
  pkg.installed:
    - name: "{{ bitwarden.package }}"
{%- endif %}
