# Bitwarden Formula
Sets up and configures Bitwarden Desktop password manager client.

## Usage
Applying `tool-bitwarden` will make sure Bitwarden Desktop is configured as specified.

### MacOS
If you want to use biometric authentication in the browser extensions, you will need to install Bitwarden from the Mac App Store. You can configure this formula to do that automatically, but it has a dependency on another one of the `tool` formulae: `tool-mas`.

## Configuration
### Pillar
#### General `tool` architecture
Since installing user environments is not the primary use case for saltstack, the architecture is currently a bit awkward. All `tool` formulas assume running as root. There are three scopes of configuration:
1. per-user `tool`-specific
  > e.g. generally force usage of XDG dirs in `tool` formulas for this user
2. per-user formula-specific
  > e.g. setup this tool with the following configuration values for this user
3. global formula-specific (All formulas will accept `defaults` for `users:username:formula` default values in this scope as well.)
  > e.g. setup system-wide configuration files like this

**3** goes into `tool:formula` (e.g. `tool:git`). Both user scopes (**1**+**2**) are mixed per user in `users`. `users` can be defined in `tool:users` and/or `tool:formula:users`, the latter taking precedence. (**1**) is namespaced directly under `username`, (**2**) is namespaced under `username: {formula: {}}`.

```yaml
tool:
######### user-scope 1+2 #########
  users:                         #
    username:                    #
      xdg: true                  #
      dotconfig: true            #
      formula:                   #
        config: value            #
####### user-scope 1+2 end #######
  formula:
    formulaspecificstuff:
      conf: val
    defaults:
      yetanotherconfig: somevalue
######### user-scope 1+2 #########
    users:                       #
      username:                  #
        xdg: false               #
        formula:                 #
          otherconfig: otherval  #
####### user-scope 1+2 end #######
```

#### User-specific
The following shows an example of `tool-bitwarden` pillar configuration. Namespace it to `tool:users` and/or `tool:bitwarden:users`.
```yaml
user:
  bitwarden:
  # all values from data.json can go here
    config:
      userEmail: user@wtf.lol
      passwordGenerationOptions:
        length: 64
```

#### Formula-specific
```yaml
tool:
  bitwarden:
    macos_appstore: false # on MacOS, install Bitwarden from the Mac App Store, not as cask
    defaults:  # default formula configuration for all users
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
        # or: -4 (=system idle) -3 (system sleep) -2 (system lock), -1 (restart), null (never)
        lockOption: 5
        # Minimize when copying to clipboard
        minimizeOnCopyToClipboardKey: false
        # Do not prompt for Touch ID on launch
        noAutoPromptBiometrics: false
        # Start automatically at login (@TODO: check if setting this is sufficient)
        openAtLogin: true
        passwordGenerationOptions:
          # [*] Password [*] Passphrase
          type: password # or passphrase
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
        theme: null              # null for Default, else "light", "dark", "nord"
        # Vault Timeout Action
        vaultTimeoutAction: lock # lock or logOut
```

## Todo
- Bitwarden CLI, either here as option or separate formula

## Reference
- https://bitwarden.com/help/article/data-storage/
- https://bitwarden.com/help/article/configure-clients/
