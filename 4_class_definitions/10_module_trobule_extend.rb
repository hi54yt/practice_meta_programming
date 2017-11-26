module MyModule
  def my_method
    'hello'
  end
end


# 可以通过Object#extend()方法进行对象扩展和类扩展，是在接受者eigenclass里包含模块的快捷方式
obj = Object.new
obj.extend MyModule
p obj.my_method # => "hello"

class MyClass
  extend MyModule
end

p MyClass.my_method # => "hello"
