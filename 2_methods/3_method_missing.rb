module Other
  class Computer
    def initialize(computer_id, data_source)
      @id = computer_id
      @data_source = data_source
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

    # 1 - Method Missing

    # Object#display优先级比Computer#display高，造成冲突
    # Object.instance_methods.grep(/^d/) # => [:define_singleton_method, :display, :dup]

    # 白板类（Blank Slate）
    instance_methods.each do |m|
      undef_method m unless m.to_s =~ /^__|method_missing|object_id|respond_to?/
    end

    def respond_to?(method)
      @data_source.respond_to?("get_#{method}_info") || super
    end

    # 动态代理Dynamic Proxy
    def method_missing(name, *args)
        super if !@data_source.respond_to?("get_#{name}_info")
        info = @data_source.send("get_#{name}_info", @id)
        price = @data_source.send("get_#{name}_price", @id)
        result = "#{name.capitalize}: #{info} ($#{price})"
        return " * #{result}" if price >= 100
        result
    end
  end
end
