# TODO

## Project Management

- [ ] Verify systemd units (use `systemd-analyze --user verify`)
- [ ] Lint zsh scripts (maybe use sandboxed `zsh -n`?)
- [ ] Lint other shell scripts (use `shellcheck`)
- [ ] Lint lua code (use `selene` once a stdlib is available, or luacheck)
- [ ] Validate JSON & YAML files against schemas in git hooks
- [ ] Verify `.desktop` files (use `desktop-file-validate`)
- [ ] Lint Powershell scripts
- [ ] Lint templates

## Adding files

- [ ] Add Git config files
  - [ ] Figure out how to handle scalar & maintenance config options
- [ ] Add Powershell configs for linux & mac os
  - [ ] Unify Windows, Linux, and Mac OS Powershell configs
- [ ] Add npm config
  - [ ] Fully update npm config to account for mise usage
- [ ] Add glab config
  - [ ] Figure out how to omit secrets from config
- [ ] Add scripts to configure Mac OS preferences
- [ ] Add docker-cli config files
  - [ ] Setup scripts to generate docker contexts

## Playbooks

- [ ] Automate atuin login
