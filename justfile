set shell := ["/usr/bin/env", "bash", "-c"]
set quiet

JUST_EXECUTABLE := "just -u -f " + justfile()
header := "Available tasks:\n"

_default:
    @{{JUST_EXECUTABLE}} --list-heading "{{header}}" --list

# Switch to a new home-manager generation
home:
    home-manager switch --flake '.?submodules=1'

# Switch to a new nixos generation
nixos $NIXOS_ENABLE_KILL_SWITCH="true":
    sudo --preserve-env="NIXOS_ENABLE_KILL_SWITCH" nixos-rebuild switch --flake '.?submodules=1' --impure

# Build the generations
boot:
    #!/usr/bin/env bash
    NIXOS_ENABLE_KILL_SWITCH="true" sudo --preserve-env="NIXOS_ENABLE_KILL_SWITCH" nixos-rebuild boot --flake '.?submodules=1' --impure
    NIXOS_ENABLE_KILL_SWITCH="false" sudo --preserve-env="NIXOS_ENABLE_KILL_SWITCH" nixos-rebuild boot --flake '.?submodules=1' --impure

# Switch both, home and nixos
both: nixos && home
