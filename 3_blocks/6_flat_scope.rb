my_var = 'Success'

# class MyClass
#   # 在这里打印my_var
#   def my_method
#     # 在这里打印my_var
#   end
# end
# 用方法调用代替作用域门：用一个闭包获取当前绑定，并把这个闭包传递给该方法，这就形成了一个扁平作用域。
MyClass = Class.new do
  puts "#{my_var} in the class definition!"
  define_method :my_method do
    puts "#{my_var} in method!"
  end
end

obj = MyClass.new
obj.my_method
