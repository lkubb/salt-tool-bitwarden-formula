{%- from 'tool-bitwarden/map.jinja' import bitwarden -%}

include:
  - .package
{%- if bitwarden.users | selectattr('bitwarden.config', 'defined') %}
  - .config
{%- endif %}
