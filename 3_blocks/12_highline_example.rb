require 'highline'

h1 = HighLine.new
friends = h1.ask("Friends?", lambda { |s| s.split(',') })
puts "You're friends with: #{friends.inspect}"

name = h1.ask("Name?", lambda { |s| s.capitalize })
puts "Hello, #{name}"
