def add_method_to(a_class)
  a_class.class_eval do
    def m; 'abc'; end
  end
end

add_method_to String

puts '123'.m

MyClass.class_eval do
  def m
    "hello!"
  end
end

puts MyClass.new.m
