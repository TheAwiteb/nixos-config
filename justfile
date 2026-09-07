set shell := ["/usr/bin/env", "bash", "-c"]
set quiet

JUST_EXECUTABLE := "just -u -f " + justfile()
header := "Available tasks:\n"

_default:
    @{{JUST_EXECUTABLE}} --list-heading "{{header}}" --list

# Switch to a new home-manager generation
home:
    home-manager switch --flake '.?submodules=1'

# Switch to a new host generation
host:
    sudo nixos-rebuild switch --flake '.?submodules=1'

# Switch both, home and host
both: host && home
