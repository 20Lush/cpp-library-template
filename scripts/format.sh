VERIFY_MODE=false

if ! test -f ./../.Dependencies/.clang-format; then
  echo "[ERROR} .clang-format not found!! have you ran get_dependencies.sh yet?"
  exit 1
fi

cd ..
cp ./.Dependencies/.clang-format ./

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
            echo -e "[ERROR] Option flag required when passing in an argument. Stop."
            exit 1
            ;;
    esac
done

if $VERIFY_MODE; then

    echo "[INFO] Verifying formatting in source/headers... "
    exit 0
fi

echo "[INFO] Formatting code! This could take a while..."

find ./ -iname *.hpp -o -iname *.cpp  -o -iname *.h | xargs clang-format -style=file:./.clang-format -i

echo "[INFO] ...Done!"

rm ./.clang-format

echo "[INFO] Cleaning up. Bye bye."