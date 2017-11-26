class MyClass
  define_method :my_method do |my_arg|
    my_arg * 3
  end

  def method_missing(method, *args)
    puts "You called: #{method}(#{args.join(', ')})"
    puts "(You also passed it a block)" if block_given?
  end
end

my_obj = MyClass.new
puts my_obj.send(:my_method, 2)
puts my_obj.my_method(2)
my_obj.ghost_method(1, 2) do

end
