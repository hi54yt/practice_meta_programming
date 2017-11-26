# 0. Orignal Code

# def event(name)
#   puts "ALTER: #{name}" if yield
# end

# 1. My Code

# def event(name, &block)
#   @events[name] = block
# end
#
# def setup(&block)
#   @setups << block
# end

# # 我的决绝方案中，没有考虑分文件加载setup，还有实例变量归属问题
# @events = {}
# @setups = []
#
# Dir.glob('*events.rb').each { |file| load file }
#
# @events.each do |name, block|
#   @setups.each do |setup|
#     setup.call
#   end
#   puts "ALTER: #{name}" if block.call
# end
#
# p self.instance_variables
#
#

# 2. Anwser 1
# Dir.glob('*events.rb').each do |file|
#   @events = {}
#   @setups = []
#   load file
#   @events.each_pair do |name, block|
#     env = Object.new
#     @setups.each do |setup|
#       # REVIEW Object对象充当了一个洁净室，实例变量属于这个Object对象
#       env.instance_eval &setup
#     end
#     puts "ALTER: #{name}" if env.instance_eval &block
#   end
# end

# 3. Anwser 2

lambda {
  # 共享作用域替代之前的顶级实例变量
  setups = []
  events = {}

  Kernel.send :define_method, :event do |name, &block|
    # @events[name] = block # REVIEW my code, 此时应该弃用实例变量
    events[name] = block  # block此时是一个Proc对象
  end

  Kernel.send :define_method, :setup do |&block|
    setups << block
  end

  # Kernel.send :define_method, :events_each do |name, &block| # REVIEW 将块绑定到block变量
  Kernel.send :define_method, :events_each do |&block|
    events.each_pair do |name, event|
      # block.call # REVIEW 需要传参
      block.call name, event
    end
  end

  # Kernel.send :define_method, :setups_each do |&setup|
  Kernel.send :define_method, :setups_each do |&block|
    setups.each do |setup|
      block.call setup
    end
  end
}.call

Dir.glob('*events.rb').each do |file|
  load file
  events_each do |name, event|
    env = Object.new
    setups_each do |setup|
      # Object对象充当了一个洁净室，实例变量属于这个Object对象
      env.instance_eval &setup
      p env.instance_variables
    end
    puts "ALTER: #{name}" if env.instance_eval &event
  end
end
