# -*- coding: utf-8 -*-
# vim: ft=yaml
---
tool_global:
  users:
    user:
      completions: .completions
      configsync: true
      persistenv: .bash_profile
      rchook: .bashrc
      xdg: true
      bitwarden:
        config:
          alwaysShowDock: false
          biometric: true
          clearClipboardKey: 30
          disableFavicon: false
          enableCloseToTray: true
          enableMinimizeToTray: true
          enableStartToTrayKey: true
          enableTray: true
          enabledBiometric: true
          environmentUrls:
            api: null
            base: https://pass.fsociety.org
            events: null
            forcePasswordReset: false
            icons: null
            identity: null
            notifications: null
            webVault: null
          kdf: 0
          kdfIterations: 100000
          lockOption: 5
          minimizeOnCopyToClipboardKey: false
          noAutoPromptBiometrics: false
          openAtLogin: true
          passwordGenerationOptions:
            ambiguous: false
            capitalize: false
            includeNumber: false
            length: 20
            lowercase: true
            minLowercase: 0
            minNumber: 1
            minSpecial: 1
            minUppercase: 0
            numWords: 3
            number: true
            special: true
            type: password
            uppercase: true
            wordSeparator: '-'
          rememberEmail: true
          rememberedEmail: elliotalderson@protonmail.ch
          userEmail: elliotalderson@protonmail.ch
          vaultTimeoutAction: lock
tool_bitwarden:
  lookup:
    master: template-master
    # Just for testing purposes
    winner: lookup
    added_in_lookup: lookup_value

    pkg:
      manager: snap
      name: bitwarden
    paths:
      confdir: 'snap/bitwarden/current/.config/Bitwarden'
      conffile: 'data.json'

  tofs:
    # The files_switch key serves as a selector for alternative
    # directories under the formula files directory. See TOFS pattern
    # doc for more info.
    # Note: Any value not evaluated by `config.get` will be used literally.
    # This can be used to set custom paths, as many levels deep as required.
    files_switch:
      - any/path/can/be/used/here
      - id
      - roles
      - osfinger
      - os
      - os_family
    # All aspects of path/file resolution are customisable using the options below.
    # This is unnecessary in most cases; there are sensible defaults.
    # path_prefix: template_alt
    # dirs:
    #   files: files_alt
    #   default: default_alt
    # The entries under `source_files` are prepended to the default source files
    # given for the state
    # source_files:
    #   tool-bitwarden-config-file-file-managed:
    #     - 'example_alt.tmpl'
    #     - 'example_alt.tmpl.jinja'

    # For testing purposes
    source_files:
      Bitwarden config file is managed for user 'user':
        - 'data.json'
        - 'data.json.jinja'

  # Just for testing purposes
  winner: pillar
  added_in_pillar: pillar_value
