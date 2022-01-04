{%- from 'tool-bitwarden/map.jinja' import bitwarden -%}

Bitwarden is installed:
  pkg.installed:
    - name: {{ bitwarden.package }}
