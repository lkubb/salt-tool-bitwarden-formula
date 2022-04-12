# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as bitwarden with context %}


Check if snap is available:
  cmd.run:
    - name: which snap

Bitwarden is installed:
  cmd.run:
    - name: snap install '{{ bitwarden.lookup.pkg.name }}'
    - unless: snap list '{{ bitwarden.lookup.pkg.name }}'
    - require:
      - Check if snap is available
