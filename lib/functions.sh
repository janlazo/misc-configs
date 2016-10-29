#!/bin/sh

# Note that () brackets, not {}, are used to wrap the function
# This is used to implement local scoping for POSIX compliance
backup()
(
    BACKUP_D="";

    while getopts b: opt;
    do
        case $opt in
            b)
                BACKUP_D="$OPTARG";
                ;;
            *)
                printf "\nInvalid option: -$OPTARG\n"
                exit 1;
                ;;
        esac
    done

    shift $(( OPTIND - 1 ))
    (test -z "BACKUP_D") && return;

    # TODO: Handle error via early return
    for file in "$@";
    do
        (test -e "$file") && mv -f "$file" "$BACKUP_D";
    done;

    # Cleanup
    BACKUP_D="";
)
