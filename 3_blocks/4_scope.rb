# 作用域门（scope gate）：class、module、def
v1 = 1

class MyClass
  v2 = 2
  puts local_variables      # => [:v2]

  def my_method
    v3 = 3
    puts local_variables
  end

  puts local_variables      # => [:v2]
end

obj = MyClass.new
obj.my_method               # => [:v3]
obj.my_method               # => [:v3]
puts local_variables        # => [:v1, :obj]
