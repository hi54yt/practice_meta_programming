obj = Object.new

eigenclass = class << obj
  self
end

puts eigenclass.class

# 定义一个单件方法，既不存在于obj对象，也不存在于Object，存在于单件类eigenclass
def obj.my_singleton_method_1
end

# 用instance_eval定义一个单件方法
obj.instance_eval do
  def my_singleton_method_2
  end
end

# classs << an_object; end可以让你进入该eigenclass的作用域
class << obj
  def my_singleton_method_3
  end
end

# 定义类方法：
# 常规方法，打开一个类
class Object
  def self.my_class_method_1
  end
end

# 单件方法的写法
def Object.my_class_method_2
end

# 类方法本质上是eigenclass，可以用classs << an_object; end语法进入该eigenclass的作用域
class << Object
  def my_class_method_3
  end
end

# 用instance_eval定义一个单件方法
Object.instance_eval do
  def my_class_method_4
  end
end

puts eigenclass.instance_methods.grep(/my_/)
puts eigenclass.methods.grep(/my_/)
