#!/bin/bash -e

BUILD_DIRECTORY="$PWD/../build"
BUILD_TYPE="DEBUG"

CMAKE_BOILERPLATE="$PWD/../.CMake-Boilerplate"

INSTALL_DIRECTORY="${BUILD_DIRECTORY}/install"

TESTING=false

while getopts 'b:t:h' opt; do
    case "$opt" in
        b)
            BUILD_TYPE="$OPTARG"
            ;;
        t)
            TESTING=true
            ;;
        h)
            echo "====== HELP DIALOGUE ===================================================================="
            echo "  Usage: $(basename $0) [-h help] [-b built type(DEBUG or RELEASE)] [-t enable testing]  "
            echo "String option should go before the flag it applies to. i.e. >>> ./compile.sh DEBUG -b <<<"
            echo "========================================================================================="
            exit 1
            ;;
        :)
            echo -e "Option flag required when passing in an argument. Stop."
            exit 1
            ;;
    esac
done

shift "$(($OPTIND -1))"

echo "====== BUILD DIALOGUE ===================================================================="
echo "      !!! Building in $BUILD_DIRECTORY !!!                                                "
echo "      !!! Configured for $BUILD_TYPE   !!!                                                "
echo "=========================================================================================="

mkdir -p ${BUILD_DIRECTORY}
cd ${BUILD_DIRECTORY}

cmake -DCMAKE_BOILERPLATE_PATH=${CMAKE_BOILERPLATES} -DCMAKE_INSTALL_PREFIX=${INSTALL_DIRECTORY} -DENABLE_TESTING=${TESTING} -DCMAKE_BUILD_TYPE=${BUILD_TYPE} ..
cmake --build .