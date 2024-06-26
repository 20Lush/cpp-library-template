
#include "main.hpp"

// Make sure to change the namespace LIBRARY to something more specific
namespace lush::LIBRARY {

	// Any forward declerations?

	bool Printer::print_args(int argc, char** argv) {
		std::cout << "args: ";
		for (int idx = 0; idx < argc; idx++) {
			std::cout << argv[idx] << " ";
		}
		std::cout << std::endl;

		return true;
	}

}  // namespace lush::LIBRARY
