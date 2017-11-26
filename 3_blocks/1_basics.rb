# 只有在调用一个方法时才可以定义一个块。块会被直接传递给这个方法，然后该方法可以用yield关键字回调这个块。
def a_method(a, b)
  a + yield(a, b)
end
puts a_method(1, 2) {|x, y| x * y }


def b_method
  return yield if block_given?
  'no block'
end
puts b_method
puts b_method {"Here's a block!"}
