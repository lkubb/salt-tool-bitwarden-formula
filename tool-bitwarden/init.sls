{%- from 'tool-bitwarden/map.jinja' import bitwarden -%}

include:
{%- if 'Darwin' == grains.kernel and bitwarden.macos_appstore is defined and bitwarden.macos_appstore %}
  - .mas
{%- else %}
  - .package
{%- endif %}
{%- if bitwarden.users | selectattr('bitwarden.config', 'defined') %}
  - .config
{%- endif %}
