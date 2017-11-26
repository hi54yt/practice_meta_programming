# Open Classes
3.times do
  class Myclass
    puts "hello world!"
  end
end

class D
  def a
    puts "A"
  end
end

class D
  def b
    puts "B"
  end
end

d = D.new
d.a
d.b
