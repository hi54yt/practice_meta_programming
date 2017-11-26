class MyClass
  def initialize(value)
    @x = value
  end

  def my_method
    @x
  end
end

object = MyClass.new(1)
# 通过object#method()方法可以获得一个Method对象，以后可以用Method#call()进行调用，类似于lamda
# 但区别是lamda是一个闭包，在定义它的作用域中执行。Method对象会在它自身所在对象的作用域中执行
m = object.method :my_method
p m.call


unbound = m.unbind
another_object = MyClass.new(2)
m = unbound.bind(another_object)
p m.call
