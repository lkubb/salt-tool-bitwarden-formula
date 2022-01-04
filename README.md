# Bitwarden Formula
Sets up and configures Bitwarden Desktop password manager client.

## Usage
Applying `tool-bitwarden` will make sure Bitwarden Desktop is configured as specified.

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
    defaults:  # default formula configuration for all users
      config:
        biometric: true
        biometricText: unlockWithTouchId
        clearClipboardKey: 30
        enableCloseToTray: true
        enableStartToTrayKey: true
        enableTray: true
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
        lockOption: 5
        noAutoPromptBiometricsText: noAutoPromptTouchId
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
        theme: null
        vaultTimeoutAction: lock

```

## Todo
- Bitwarden CLI, either here as option or separate formula

## Reference
- https://bitwarden.com/help/article/data-storage/
- https://bitwarden.com/help/article/configure-clients/
