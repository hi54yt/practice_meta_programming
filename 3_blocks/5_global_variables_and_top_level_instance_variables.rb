# 全局变量可以在任意作用域访问
def a_scope
  $var = "some value"
end

def another_scope
  $var
end

a_scope
puts another_scope # => 'some value'





# 顶级实例变量
@var = "The top-level @var"

class MyClass
  def my_method
    @var = "This is not the top-level @var!"
  end
end

obj = MyClass.new
obj.my_method

def my_method
  @var
end

# main对象扮演self
puts my_method
