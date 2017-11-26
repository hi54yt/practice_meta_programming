# class MyClass < Array
#   def my_method
#     'Hello!'
#   end
# end

MyClass = Class.new(Array) do
  def my_method
    'Hello!'
  end
end

obj = MyClass.new
puts obj.my_method
puts obj.class.superclass
