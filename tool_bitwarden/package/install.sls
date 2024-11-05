# vim: ft=sls

{%- set tplroot = tpldir.split("/")[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as bitwarden with context %}
{%- set sls_install = slsdotpath ~ "." ~ bitwarden.lookup.pkg.manager %}

include:
  - {{ sls_install }}


Bitwarden setup is completed:
  test.nop:
    - name: Hooray, Bitwarden setup has finished.
    - require:
      - sls: {{ sls_install }}
