
#include "main.hpp"

// Make sure to change the namespace EXECUTABLE to something more specific
namespace lush::EXECUTABLE {

    // Any forward declerations?  

}

int main(int argc, char** argv) {

    std::cout << "Hello World! Executable given " << argc << " arguments." << std::endl;

    std::cout << "args: ";
    for(int idx = 0; idx < argc; idx++){
        std::cout << argv[idx] << " ";
    }
    std::cout << std::endl;

}