# module MyModule
#   def self.my_method
#     'hello'
#   end
# end
#
#
# class MyClass
#   include MyModule
# end

# module trobule solution
module MyModule
  def my_method
    'hello'
  end
end


class MyClass
  class << self
    # 打开MyClass的eigenclass作用域，my_method是MyClass的eigenclass的实例方法，也是MyClass的一个类方法，这种技术称为类扩展（Class Extension）
    include MyModule
  end
end

puts MyClass.my_method # 类扩展之前 => `<main>': undefined method `my_method' for MyClass:Class (NoMethodError)
puts MyClass.singleton_methods # => hello

# module trobule object
# 可以通过把模块混入到类的eigenclass里来定义类方法，类方法是单件方法的特例，同样也可以扩展任意一个对象。这种技巧称为对象扩展（Object Extention）
obj = Object.new
class << obj
  include MyModule
end

puts obj.my_method # => hello
puts obj.singleton_methods # => my_method
