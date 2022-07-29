# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_package_install = tplroot ~ '.package.install' %}
{%- from tplroot ~ "/map.jinja" import mapdata as bitwarden with context %}

include:
  - {{ sls_package_install }}


{%- for user in bitwarden.users | selectattr('bitwarden.config', 'defined') %}

Bitwarden configuration is synced for user '{{ user.name }}':
  file.serialize:
    - name: {{ user['_bitwarden'].conffile }}
    - serializer: json
    - merge_if_exists: true
    - dataset: {{ user.bitwarden.config | json }}
    - user: {{ user.name }}
    - group: {{ user.group }}
    - mode: '0600'
    - dir_mode: '0700'
    - makedirs: true
    - require:
      - sls: {{ sls_package_install }}
{%- endfor %}
