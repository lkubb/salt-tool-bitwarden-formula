.. _readme:

Bitwarden Formula
=================

Manages Bitwarden Desktop password manager client in the user environment.

.. contents:: **Table of Contents**
   :depth: 1

Usage
-----
Applying ``tool_bitwarden`` will make sure Bitwarden is configured as specified.

MacOS
~~~~~
If you want to use biometric authentication in the browser extensions, you will need to install Bitwarden from the Mac App Store. You can configure this formula to do that automatically, but it has a dependency on another one of the ``tool`` formulae: ``tool_mas``.
To enable this function, set ``tool_bitwarden:lookup:pkg:manager`` to ``mas``.

Configuration
-------------

This formula
~~~~~~~~~~~~
The general configuration structure is in line with all other formulae from the `tool` suite, for details see :ref:`toolsuite`. An example pillar is provided, see :ref:`pillar.example`. Note that you do not need to specify everything by pillar. Often, it's much easier and less resource-heavy to use the ``parameters/<grain>/<value>.yaml`` files for non-sensitive settings. The underlying logic is explained in :ref:`map.jinja`.

User-specific
^^^^^^^^^^^^^
The following shows an example of ``tool_bitwarden`` per-user configuration. If provided by pillar, namespace it to ``tool_global:users`` and/or ``tool_bitwarden:users``. For the ``parameters`` YAML file variant, it needs to be nested under a ``values`` parent key. The YAML files are expected to be found in

1. ``salt://tool_bitwarden/parameters/<grain>/<value>.yaml`` or
2. ``salt://tool_global/parameters/<grain>/<value>.yaml``.

.. code-block:: yaml

  user:

      # Force the usage of XDG directories for this user.
    xdg: true

      # Persist environment variables used by this formula for this
      # user to this file (will be appended to a file relative to $HOME)
    persistenv: '.config/zsh/zshenv'

      # Add runcom hooks specific to this formula to this file
      # for this user (will be appended to a file relative to $HOME)
    rchook: '.config/zsh/zshrc'

      # This user's configuration for this formula. Will be overridden by
      # user-specific configuration in `tool_bitwarden:users`.
      # Set this to `false` to disable configuration for this user.
    bitwarden:
      config:
        # Always show in the Dock
        alwaysShowDock: false
        # Unlock with [Touch ID/something else?]
        biometric: true
        # Clear Clipboard. seconds to clear after copy, null to disable
        clearClipboardKey: 30
        # Disable Website Icons
        disableFavicon: false
        # Close to menu bar
        enableCloseToTray: true
        # Minimize to menu bar
        enableMinimizeToTray: true
        # Start to menu bar
        enableStartToTrayKey: true
        # Enable Menu Bar Icon
        enableTray: true
        # the following is not affected when enabling/disabling unlocking
        # with biometrics in settings
        enabledBiometric: true
        environmentUrls:
          base: https://pass.fsociety.org
          api: null
          events: null
          icons: null
          identity: null
          notifications: null
          webVault: null
          forcePasswordReset: false
        kdf: 0
        kdfIterations: 100000
        # Vault Timeout
        # minutes of inactivity until timeout
        # or: -4 (=system idle) -3 (system sleep) -2 (system lock),
        #     -1 (restart), null (never)
        lockOption: 5
        # Minimize when copying to clipboard
        minimizeOnCopyToClipboardKey: false
        # Do not prompt for Touch ID on launch
        noAutoPromptBiometrics: false
        # Start automatically at login
        # (@TODO: check if setting this is sufficient)
        openAtLogin: true
        passwordGenerationOptions:
          # [*] Password [*] Passphrase
          type: password  # or passphrase
          # password: Length
          length: 20
          # password: A-Z
          uppercase: true
          # password: a-z
          lowercase: true
          # password: 0-9
          number: true
          # password: !@#$%^&*
          special: true
          # password: not available in UI
          minUppercase: 0
          # password: not available in UI
          minLowercase: 0
          # password: Minimum Numbers
          minNumber: 1
          # password: Minimum Special
          minSpecial: 1
          # password: Avoid Ambiguous Characters
          ambiguous: false
          # passphrase: Number of Words
          numWords: 3
          # passphrase: Word Separator
          wordSeparator: '-'
          # passphrase: Capitalize
          capitalize: false
          # passphrase: Include Number
          includeNumber: false
        rememberEmail: true
        rememberedEmail: elliotalderson@protonmail.ch
        userEmail: elliotalderson@protonmail.ch
        # Theme
        # null for Default, else "light", "dark", "nord"
        theme: null
        # Vault Timeout Action
        # lock or logOut
        vaultTimeoutAction: lock

Formula-specific
^^^^^^^^^^^^^^^^

.. code-block:: yaml

  tool_bitwarden:

      # Specify an explicit version (works on most Linux distributions) or
      # keep the packages updated to their latest version on subsequent runs
      # by leaving version empty or setting it to 'latest'
      # (again for Linux, brew does that anyways).
    version: latest

      # Default formula configuration for all users.
    defaults:
      config: default value for all users

Config file serialization
~~~~~~~~~~~~~~~~~~~~~~~~~
This formula serializes configuration into a config file. A default one is provided with the formula, but can be overridden via the TOFS pattern. See :ref:`tofs_pattern` for details.

Development
-----------

Contributing to this repo
~~~~~~~~~~~~~~~~~~~~~~~~~

Commit messages
^^^^^^^^^^^^^^^

Commit message formatting is significant.

Please see `How to contribute <https://github.com/saltstack-formulas/.github/blob/master/CONTRIBUTING.rst>`_ for more details.

pre-commit
^^^^^^^^^^

`pre-commit <https://pre-commit.com/>`_ is configured for this formula, which you may optionally use to ease the steps involved in submitting your changes.
First install  the ``pre-commit`` package manager using the appropriate `method <https://pre-commit.com/#installation>`_, then run ``bin/install-hooks`` and
now ``pre-commit`` will run automatically on each ``git commit``.

.. code-block:: console

  $ bin/install-hooks
  pre-commit installed at .git/hooks/pre-commit
  pre-commit installed at .git/hooks/commit-msg

State documentation
~~~~~~~~~~~~~~~~~~~
There is a script that semi-autodocuments available states: ``bin/slsdoc``.

If a ``.sls`` file begins with a Jinja comment, it will dump that into the docs. It can be configured differently depending on the formula. See the script source code for details currently.

This means if you feel a state should be documented, make sure to write a comment explaining it.

Todo
----
* Bitwarden CLI, either here as option or separate formula

Reference
---------
* https://bitwarden.com/help/article/data-storage/
* https://bitwarden.com/help/article/configure-clients/
