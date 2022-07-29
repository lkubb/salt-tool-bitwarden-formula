# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as bitwarden with context %}

include:
  - {{ slsdotpath ~ '.' ~ bitwarden.lookup.pkg.manager ~ '.clean' }}
