VERIFY_MODE=false

# Handle command line arguments
while getopts 'v:h' opt; do
    case "$opt" in
        v)
            $VERIFY_MODE=true
            ;;
        h)
            echo "====== HELP DIALOGUE ===================================================================="
            echo "  Usage: $(basename $0) [-h help] [-v verify formatting in project]  "
            echo "========================================================================================="
            exit 1
            ;;
        :)
            echo -e "Option flag required when passing in an argument. Stop."
            exit 1
            ;;
    esac
done

if $VERIFY_MODE; then

    echo " Verifying formatting in source/headers... "
    exit 0
fi

cd .. 
find ./ -iname *.hpp -o -iname *.cpp  -o -iname *.h | xargs clang-format -i