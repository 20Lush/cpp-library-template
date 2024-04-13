
#include <gtest/gtest.h>

#include "main.hpp"

using namespace lush::LIBRARY;

TEST(LIBRARY_TEMPLATE_TEST, ExampleTest) {

    Printer printer;

    const int argc_test = 2;

    char* argv_test[argc_test + 1] = {"/my/path", "my_arg"};

    bool succes = printer.print_args(argc_test, argv_test);

    EXPECT_EQ(succes, true);

}