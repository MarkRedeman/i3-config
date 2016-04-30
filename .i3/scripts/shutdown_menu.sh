#!/usr/bin/zsh

main() {
    readonly options=("1. lock
2. logout
3. suspend
4. restart
5. shutdown")

    prompt() {
        printf "%s\n" "$@" | rofi -dmenu -i -p "Menu: "
    }

    case "$(bc -q  <<< "$(prompt "${options[@]}") + 1")" in
        1) lock ;;
        2) i3-msg exit ;;
        3) systemctl suspend ;;
        4) systemctl reboot ;;
        5) systemctl poweroff ;;
    esac
}

main
exit 0
