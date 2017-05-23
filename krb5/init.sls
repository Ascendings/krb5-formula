{% from "krb5/map.jinja" import krb5_settings as krb5 with context %}

krb5_package:
  pkg.{{ krb5.package_status }}:
    - name: {{ krb5.package_name }}

krb5_config:
  file.managed:
    - name: {{ krb5.config_path }}
    - template: jinja
    - source: salt://krb5/files/krb5.conf
    - mode: {{ krb5.config_mode }}
    - require:
      - pkg: krb5_package

