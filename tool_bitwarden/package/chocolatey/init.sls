# vim: ft=sls

{%- set tplroot = tpldir.split("/")[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as bitwarden with context %}


Bitwarden is installed:
  chocolatey.installed:
    - name: {{ bitwarden.lookup.pkg.name }}
