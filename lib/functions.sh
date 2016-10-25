#!/bin/sh

## Functions
backup() {
    # TODO: Add UUID or unique date as part of backup folder name
    BACKUP_D="$HOME/.bak";

    (test ! -d "$BACKUP_D") && mkdir "$BACKUP_D";

    # TODO: Handle error via early return
    for file in "$@";
    do
        printf "Moving %s in %s\n" "$file" "$BACKUP_D";
        (test -e "$file") && mv -f "$file" "$BACKUP_D";
    done;

    # Cleanup
    BACKUP_D="";
}
