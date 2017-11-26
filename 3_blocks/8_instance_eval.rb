class MyClass
  def initialize
    @v = 1
  end
end

obj = MyClass.new
obj.instance_eval do
  # 传递到instance_eval中的代码块称为上下文探针（Context Probe），它可以深入到对象中的代码片段，对其进行操作。
  p @v    # => 1
  p self  # => <MyClass:0x007fe1fa0a6160 @v=1>
end

v = 2
obj.instance_eval { @v = v }
obj.instance_eval { p @v } # => 2


# instance_exec 和 instance_eval相似，但允许传入参数
MyClass.new.instance_exec(3) { |arg| p @v * arg } # => 3
obj.instance_exec(3) { |arg| p @v * arg }         # => 6
