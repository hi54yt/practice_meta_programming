class C
  def a_method
    "C#a_method()"
  end
end

class D < C
end

obj = D.new
obj.a_method


class Object
  def eigenclass
    class << self
      self
    end
  end
end

puts "abc".eigenclass # => #<Class:#<String:0x007fdf6d884010>>


class << obj
  def a_singleton_method
    'obj#a_singleton_method()'
  end
end

puts obj.eigenclass             # => #<Class:#<D:0x007fdf6d884010>>
puts obj.eigenclass.superclass  # => D

class C
  class << self
    def a_class_method
      'C.a_class_method()'
    end
  end
end

puts C.eigenclass              # => #<Class:C>
puts D.eigenclass              # => #<Class:D>
puts C.eigenclass.superclass   # => #<Class:Object>
puts D.eigenclass.superclass   # => <Class:C>

# D的单件方法（eigenclass）的超类(superclass)，是他超类(C)的单件方法 (<Class:C>)
puts D.a_class_method          # => C.a_class_method()
