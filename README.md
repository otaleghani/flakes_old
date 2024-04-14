# Flakes

### Installation

You can create different installation by creating a new directory in ./hosts and adding it's declaration inside of flake.nix.
Then just run `sudo nixos-rebuild switch --flake #default` to rebuild the system.

### Script to implement
``` sh
# open tmux session based on the selected work
cd $(find Workspace/* -type d | fzf) && tmux new -neditor -swork nvim . 
```

### To do
- [ ] tmux plugins
- [ ] terminal img manipulator
- [ ] bitwarden cli
- [ ] setup calcurse
- [ ] ssh accounts management
- [ ] restapi client nvim
- [ ] implement cmds
