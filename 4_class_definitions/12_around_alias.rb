class String
  alias :real_length :length

  def length
    real_length > 5 ? 'long' : 'short'
  end
end

puts 'War and Peace'.length       # => "long"
puts 'War and Peace'.real_length  # => 13
