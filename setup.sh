#!/bin/bash

sudo -v || exit 1

main_menu_items=("Automatic" "Manual" "Exit")

init_scripts=("00.timezone.sh" "01.sudoer.sh" "02.fix-watchers.sh" "03.mirrors.sh" "04.dev.sh" "05.touchpad.sh" "06.bluetooth.sh" "07.audio.sh")
install_scripts=( "01.paru.sh" "02.xorg.sh" "03.packages.sh" "04.apps.sh" "05.fonts.sh" "06.tmux.sh" "07.docker.sh" "08.omz.sh" "09.virtualbox.sh" "10.wayland.sh" "11.hyprpm.sh")

init_selected=()
install_selected=()

for ((i = 0; i < ${#init_scripts[@]}; i++)); do
    init_selected[i]=0
done

for ((i = 0; i < ${#install_scripts[@]}; i++)); do
    install_selected[i]=0
done

if [[ -d "./00.init.d" && -d "./01.install.d" ]]; then
    source_type="clone"
else
    source_type="online"
fi

main_menu() {
    local cursor=0

    while true; do
        clear

        echo "ARCH-ITECT | Arch Linux Setup Script [$source_type mode]"
        echo

        for ((i = 0; i < ${#main_menu_items[@]}; i++)); do
            if ((i == cursor)); then
                printf "> %s\n" "${main_menu_items[i]}"
            else
                printf "  %s\n" "${main_menu_items[i]}"
            fi
        done

        read -rsn1 key

        case "$key" in
            $'\x1b')
                read -rsn2 key

                case "$key" in
                    '[A') ((cursor--)) ;;
                    '[B') ((cursor++)) ;;
                esac
                ;;

            "")
                case "${main_menu_items[cursor]}" in
                    "Automatic")
                        automatic
                        ;;

                    "Manual")
                        manual
                        ;;

                    "Exit")
                        clear
                        exit 0
                        ;;
                esac
                ;;
        esac

        ((cursor < 0)) && cursor=$((${#main_menu_items[@]} - 1))
        ((cursor >= ${#main_menu_items[@]})) && cursor=0
    done
}


automatic() {
        echo
        clear
        echo "Installation finished"
        exit 0
}


manual() {
    manual_page=0

    while true; do
        case "$manual_page" in
            0)
                init_page
                ;;

            1)
                install_page
                ;;
        esac
    done
}


init_page() {
    local cursor=0
    local script_count=${#init_scripts[@]}
    local back_index=$script_count
    local next_index=$((script_count + 1))
    local total=$((script_count + 2))

    while true; do
        clear

        printf "Arch-itect                         1 / 2\n"
        echo
        printf '\033[1minit\033[0m\n'
        echo

        for ((i = 0; i < script_count; i++)); do

            if ((i == cursor)); then
                printf "> "
            else
                printf "  "
            fi

            if ((init_selected[i])); then
                printf "[x] %s\n" "${init_scripts[i]}"
            else
                printf "[ ] %s\n" "${init_scripts[i]}"
            fi
        done

        echo

        if ((cursor == back_index)); then
            printf "> Back\n"
        else
            printf "  Back\n"
        fi

        if ((cursor == next_index)); then
            printf "> Next\n"
        else
            printf "  Next\n"
        fi

        read -rsn1 key

        case "$key" in
            $'\x1b')
                read -rsn2 key

                case "$key" in
                    '[A') ((cursor--)) ;;
                    '[B') ((cursor++)) ;;
                esac
                ;;

            "")
                if ((cursor < script_count)); then
                    init_selected[cursor]=$((1 - init_selected[cursor]))

                elif ((cursor == back_index)); then
                    return

                elif ((cursor == next_index)); then
                    manual_page=1
                    return
                fi
                ;;
        esac

        ((cursor < 0)) && cursor=$((total - 1))
        ((cursor >= total)) && cursor=0
    done
}


install_page() {
    local cursor=0
    local script_count=${#install_scripts[@]}
    local back_index=$script_count
    local submit_index=$((script_count + 1))
    local total=$((script_count + 2))

    while true; do
        clear

        printf "Arch-itect                         2 / 2\n"
        echo
        printf '\033[1minstall\033[0m\n'
        echo

        for ((i = 0; i < script_count; i++)); do

            if ((i == cursor)); then
                printf "> "
            else
                printf "  "
            fi

            if ((install_selected[i])); then
                printf "[x] %s\n" "${install_scripts[i]}"
            else
                printf "[ ] %s\n" "${install_scripts[i]}"
            fi
        done

        echo

        if ((cursor == back_index)); then
            printf "> Back\n"
        else
            printf "  Back\n"
        fi

        if ((cursor == submit_index)); then
            printf "> Submit\n"
        else
            printf "  Submit\n"
        fi

        read -rsn1 key

        case "$key" in
            $'\x1b')
                read -rsn2 key

                case "$key" in
                    '[A') ((cursor--)) ;;
                    '[B') ((cursor++)) ;;
                esac
                ;;

            "")
                if ((cursor < script_count)); then
                    install_selected[cursor]=$((1 - install_selected[cursor]))

                elif ((cursor == back_index)); then
                    manual_page=0
                    return

                elif ((cursor == submit_index)); then
                    submit
                    return
                fi
                ;;
        esac

        ((cursor < 0)) && cursor=$((total - 1))
        ((cursor >= total)) && cursor=0
    done
}


submit() {
    clear

    echo "Arch-itect"
    echo
    echo "Selected scripts:"
    echo

    local found=0

    for ((i = 0; i < ${#init_scripts[@]}; i++)); do
        if ((init_selected[i])); then
            printf "\rInstalling %-30s" "${init_scripts[i]}"
            yes | sudo bash "00.init.d/${init_scripts[i]}" >/dev/null 2>&1
        fi
    done

    for ((i = 0; i < ${#install_scripts[@]}; i++)); do
        if ((install_selected[i])); then
            printf "\rInstalling %-30s" "${install_scripts[i]}"
            yes | sudo bash "01.install.d/${install_scripts[i]}" >/dev/null 2>&1
        fi
    done

    if ((found == 0)); then
        echo
        clear
        echo "Installation finished"
        exit 0
    fi

    echo
    echo "Running selected scripts..."
    echo

    for ((i = 0; i < ${#init_scripts[@]}; i++)); do
        if ((init_selected[i])); then
            echo "==> ${init_scripts[i]}"
            sudo bash "00.init.d/${init_scripts[i]}"
            echo
        fi
    done

    for ((i = 0; i < ${#install_scripts[@]}; i++)); do
        if ((install_selected[i])); then
            echo "==> ${install_scripts[i]}"
            sudo bash "01.install.d/${install_scripts[i]}"
            echo
        fi
    done

    echo
    echo "Installation finished"
    sleep 2
    clear
    exit 0
}

main_menu
