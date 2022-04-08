# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as bitwarden with context %}

include:
  - {{ slsdotpath ~ '.' ~ bitwarden.lookup.pkg.manager ~ '.clean' }}
