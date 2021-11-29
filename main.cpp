#include <ea_data_structures/ea_data_structures.h>
#include <iostream>

int main()
{
    EA::Vector<int> vec {1,2,3,4};

    for (auto& element: vec)
        std::cout << element << std::endl;
}