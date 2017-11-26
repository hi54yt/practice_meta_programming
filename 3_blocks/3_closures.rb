def my_method
  x = "GoodBye"
  yield('Cruel')
end

x = "Hello"
# 闭包(closures)：当定义一个块时，块会获取当前环境（作用域）里的绑定(bindings：局部变量、实例变量、self等),
# 把快传给一个方法时，它会带着这些绑定一起进入该方法
my_method { |y| puts "#{x}, #{y} World!" }
