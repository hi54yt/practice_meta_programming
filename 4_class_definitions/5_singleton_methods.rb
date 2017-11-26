str = "just a regualr string"

# Ruby允许给单个对象增加一个方法，其他对象不会得到该方法，即使是其他String对象。
def str.title?
  self.upcase == self
end

puts str.title?
puts str.methods.grep(/title/)
puts str.singleton_methods
