class Array
  def replace(from, to)
    each_with_index do |e, i|
      self[i] = to if e == from
    end
  end
end


def test_place
  book_topics = ['html', 'js', 'css']
  book_topics.replace('html', 'ruby')
  puts book_topics
end

test_place
