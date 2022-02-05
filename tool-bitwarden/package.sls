{%- from 'tool-bitwarden/map.jinja' import bitwarden -%}

include:
  - tool-mas

Bitwarden is installed:
  pkg.installed:
    - name: "{{ bitwarden.package }}"
