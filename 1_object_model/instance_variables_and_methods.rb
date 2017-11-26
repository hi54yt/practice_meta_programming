class MyClass
  def my_method
    @v = 1
  end
end

obj = MyClass.new
puts "class: #{obj.class}"

puts "list instance variables before call my_method: #{obj.instance_variables}"

obj.my_method

puts "list instance variables after call my_method: #{obj.instance_variables}"

puts obj.methods.grep(/my_/)


puts String.instance_methods == 'abc'.methods
puts String.methods == 'abc'.methods
