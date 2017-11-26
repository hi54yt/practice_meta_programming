class Ds
  ['mouse', 'keyboard', 'cpu', 'display'].each do |device|
    define_method("get_#{device}_info") do |arg|
      ('a'..'z').to_a.sample
    end

    define_method("get_#{device}_price") do |arg|
      rand(200)
    end
  end
end
