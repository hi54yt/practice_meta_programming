class MyClass
  def my_method
    'my_method()'
  end

  # alias是一个关键字，而非方法
  alias :m :my_method
end

obj = MyClass.new
p obj.m
p obj.my_method

class MyClass
  alias_method :m2, :m
end

p obj.m2
