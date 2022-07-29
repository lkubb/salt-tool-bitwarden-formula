# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as bitwarden with context %}


{%- for user in bitwarden.users | selectattr('bitwarden.config', 'defined') | selectattr('bitwarden.config') %}

Bitwarden config dir is absent for user '{{ user.name }}':
  file.absent:
    - name: {{ user['_bitwarden'].confdir }}
{%- endfor %}
