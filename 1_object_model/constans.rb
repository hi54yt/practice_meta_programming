module MyModule
  MyConstant = "Outer constant"
  class MyClass
    MyConstant = "Inner constant"
  end
end

puts MyModule::MyConstant
puts MyModule::MyClass::MyConstant
