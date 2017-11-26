class Computer
  def initialize(computer_id, data_source)
    @id = computer_id
    @data_source = data_source
    # 内省（Introspection）的方式缩减代码
    @data_source.methods.grep(/^get_(.*)_info$/) {Computer.define_component $1}
  end

  # 0 - Orignal Code

  # def mouse
  #   info = @data_source.get_mouse_info(@id)
  #   price = @data_source.get_mouse_price(@id)
  #   result = "Mouse: #{info} ($#{price})"
  #   return " * #{result}" if price >= 100
  #   result
  # end
  #
  # def cpu
  #   info = @data_source.get_mouse_info(@id)
  #   price = @data_source.get_mouse_price(@id)
  #   result = "Cpu: #{info} ($#{price})"
  #   return " * #{result}" if price >= 100
  #   result
  # end
  #
  # def keyboard
  #   info = @data_source.get_mouse_info(@id)
  #   price = @data_source.get_mouse_price(@id)
  #   result = "Keyboard: #{info} ($#{price})"
  #   return " * #{result}" if price >= 100
  #   result
  # end

  # 1 - Dynamic Dispatch

  # def mouse
  #   component :mouse
  # end
  #
  # def cpu
  #   component :cpu
  # end
  #
  # def keyboard
  #   component :keyboard
  # end
  #
  # mouse等方法的调用被代理到component
  # def component(name)
  #   info = @data_source.send("get_#{name}_info", @id)
  #   price = @data_source.send("get_#{name}_price", @id)
  #   result = "#{name.to_s.capitalize}: #{info} ($#{price})"
  #   return " * #{result}" if price >= 100
  #   result
  # end

  # 2 - Dynamic Method

  def self.define_component(name)
    define_method(name) {
      info = @data_source.send("get_#{name}_info", @id)
      price = @data_source.send("get_#{name}_price", @id)
      result = "#{name.capitalize}: #{info} ($#{price})"
      return " * #{result}" if price >= 100
      result
    }
  end

  # define_component :mouse
  # define_component :cpu
  # define_component :keyboard
end
