#!/bin/bash


create_files() {
    for i in {1..5}; do
        touch "file$i.txt"
        echo "Hello world" > "file$i.txt"
        echo "Created file$i.txt"
    done
}


replace_text() {
    for i in {1..5}; do
        if [[ -f "file$i.txt" ]]; then
            sed -i 's/world/bash/g' "file$i.txt"
            echo "Replaced 'world' with 'bash' in file$i.txt"
        fi
    done
}


PS3="Select an option (1/2/3 - Quit): "
options=("Create five text files with 'Hello world'" "Replace 'world' with 'bash' in all text files" "Quit")

select option in "${options[@]}"; do
    case $REPLY in
        1)
            create_files
            ;;
        2)
            replace_text
            ;;
        3)
            echo "Exit!"
            exit 0
            ;;
        *)
            echo "Invalid choice. Please try again."
            ;;
    esac
done