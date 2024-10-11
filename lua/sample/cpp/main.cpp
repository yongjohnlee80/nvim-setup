#include <iostream>

int add(int a, int b) {
  std::cout << "Adding " << a << " and " << b << std::endl;
  return a + b;
}

int main() {
  int c = add(5, 6);
  std::cout << "the result of 5 and 6 is " << c << std::endl;
 int d = add(123, 65);
  std::cout << d;
  std::cout << "Hello, world";
}
