# 在一个扁平作用域里定义了多个方法，这些方法可以用一个作用域门保护，并共享绑定，这称为共享作用域。
def define_methods
  shared = 0

  Kernel.send :define_method, :counter do
    shared
  end

  Kernel.send :define_method, :inc do |x|
    shared += x
  end
end

define_methods
puts counter    # => 0
puts inc(4)     # => 4
puts counter    # => 4
