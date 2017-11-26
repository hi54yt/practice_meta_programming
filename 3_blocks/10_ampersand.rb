def math(a, b)
  yield(a, b)
end

# 要将块附加到一个绑定上，可以给这个方法添加一个特殊的参数，这个参数必须是参数列表中的最后一个，且以&符开头。
def teach_math(a, b, &operation)
  p "Let's do the math:"
  p math(a, b, &operation)
end

teach_math(2, 3) { |x, y| x + y }

p math(1, 2) { |x, y| x + y }

# &操作符的真正含义：这是一个Proc对象，我想把它当成一个块来使用。简单的去掉&就能再次得到一个Proc对象
def my_method(&the_proc)
  the_proc
end

p = my_method { |name| "Hello, #{name}!" }
puts p.class
puts p.call("Bill")
