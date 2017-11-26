class Fixnum
  alias :my_plus :+
  def +(value)
    my_plus(value).my_plus(1)
  end
end

puts 1+1
