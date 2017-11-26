def my_method(greeting)
  puts "#{greeting}, #{yield}!"
end

my_proc = Proc.new { 'Bill' }
my_method("Hello", &my_proc)
