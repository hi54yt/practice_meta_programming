# Proc可以将一个块转换成Proc对象
inc = Proc.new { |x| x += 1 }
# 可以用call执行一个Proc对象
p inc.call(2) # => 3
# 这种技术称为延迟执行（Deferred Evaluation）

dec = lambda { |x| x - 1 }
p dec.class   # => Proc
p dec.call(2) # => 1

proc = proc { |x| x - 1 }
p dec.class   # => Proc
p dec.call(2) # => 1
