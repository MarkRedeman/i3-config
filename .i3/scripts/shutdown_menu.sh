#!/bin/sh

main() {
    readonly options="1. lock
2. logout
3. suspend
4. restart
5. shutdown"

    prompt() {
        printf "%s\n" "$@" | rofi -dmenu -i -p "Menu: "
    }

    # This function returns the given integer + 1 if the input
    # is not empty and returns 0 if it is not set
    sanitize() {
        readonly possibleInt=$1

        if [ -z "$possibleInt" ]
        then
            echo 0
        else
            echo "$possibleInt + 1" | bc -q
        fi
    }

    readonly selected=$(sanitize "$(prompt "$options")")

    case $selected in
        1) lock ;;
        2) i3-msg exit ;;
        3) systemctl suspend ;;
        4) systemctl reboot ;;
        5) systemctl poweroff ;;
        *) exit ;;
    esac
}

main "$@"
exit 0
