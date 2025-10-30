set quiet
set unstable
set script-interpreter := ["/usr/bin/env", "nu"]

_default:
    @{{just_executable()}} -f {{justfile()}} --list

# Create Agit PR
agit remote base title description force:
    #!/usr/bin/env bash
    BRANCH=$(git rev-parse --abbrev-ref HEAD)
    git push {{remote}} HEAD:refs/for/{{base}}/$BRANCH -o title="{{title}}" -o description="{{description}}" -o force-push="{{force}}"

# Create a signed git tag
tag git-tag:
    TZ=UTC git tag "{{git-tag}}" -s -m "The {{trim_start_match(git-tag, 'v')}} version release"

# Add trailer to git commits
add-trailer from trailer:
    TZ=UTC git rebase {{from}} -x 'git commit --amend --no-edit --trailer "{{trailer}}"'

# Fetch a forgejo pull request
fetch-pr pr-number:
    git fetch origin +refs/pull/{{pr-number}}/head:refs/heads/pr-{{pr-number}}

# Delete all branches and keeping master
delete-branches:
    git branch | rg -v "master" | xargs git branch -D

# Run file tree for helix
file-tree:
    twilight-tree --behavior.file_action='tree-picker.sh %s' --setup.with_cwd_header=false

# Edit a lprs field in your $EDITOR
lprs-edit vault field:
    #!/usr/bin/env bash
    UUID="{{ uuid() }}"
    read -s -p "Master Password: " MASTER_PASS

    lprs -m $MASTER_PASS get "{{vault}}" {{field}} > /tmp/$UUID
    $EDITOR /tmp/$UUID
    case "{{field}}" in
      "name" | "username" | "password" | "service" | "note" | "totp-secret")
        lprs -m $MASTER_PASS edit {{vault}} --{{field}}="$(cat /tmp/$UUID)"
        ;;
      *)
        lprs -m $MASTER_PASS edit {{vault}} --custom {{field}}="$(cat /tmp/$UUID)"
        ;;
    esac
    rm -fr /tmp/$UUID

# Copy something from lprs valut to clipboard
lprs-cp vault field:
    lprs get '{{vault}}' '{{field}}' | xclip -selection clipboard

# Run Prism Launcher
prism:
    nvidia-offload prismlauncher

# Echo the git commits in the range
commits-since since:
    git log --pretty=%H '{{ since }}..HEAD'

# List the tags as `<tag>=<commit> <tag>=<commit> <tag>=<commit>`
[script]
list-tags:
    let tags = git tag | split row "\n"
    let tags_len = ($tags | length) - 1
    for idx_tag in ($tags | enumerate) {
      print -n $'"($idx_tag.item)=(git rev-parse $idx_tag.item)"'
    
      if $idx_tag.index != $tags_len {
        print -n ","
      }
    }

nostr:
    nix-shell -p rustup rust-analyzer pkg-config dbus --command zsh

alias cs := commits-since
