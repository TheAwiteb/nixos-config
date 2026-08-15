set quiet
set unstable
set script-interpreter := ["/usr/bin/env", "nu"]

_default:
    @{{just_executable()}} -f {{justfile()}} --list

# Create a signed git tag
tag git-tag:
    TZ=UTC git tag "{{git-tag}}" -s -m "The version {{trim_start_match(git-tag, 'v')}} release"

# Delete all branches and keeping master and main
delete-branches:
    git branch | rg -v "master|main" | xargs git branch -D

# Edit a lprs field in your $EDITOR
lprs-edit vault field:
    #!/usr/bin/env bash
    UUID="{{ uuid() }}"
    read -s -p "Master Password: " MASTER_PASS

    lprs -m $MASTER_PASS get "{{vault}}" "{{field}}" > /tmp/$UUID
    $EDITOR /tmp/$UUID
    case "{{field}}" in
      "name" | "username" | "password" | "service" | "note" | "totp-secret")
        lprs -m $MASTER_PASS edit "{{vault}}" --{{field}}="$(cat /tmp/$UUID)"
        ;;
      *)
        lprs -m $MASTER_PASS edit "{{vault}}" --custom "{{field}}"="$(cat /tmp/$UUID)"
        ;;
    esac
    rm -fr /tmp/$UUID

# Copy something from lprs valut to clipboard
lprs-cp vault field:
    lprs get '{{vault}}' '{{field}}' | xclip -selection clipboard

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
