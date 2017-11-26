require 'minitest/autorun'

module CheckedAttributes
  # Class Extension Mixin
  def self.included(base)
    base.extend(self)
  end

  def attr_checked(attribute, &validation)
    define_method "#{attribute}" do
      instance_variable_get("@#{attribute}")
    end

    define_method "#{attribute}=" do |value|
      # if value == nil || value == false
      #   raise 'Invalid attributes'
      # end
      raise 'Invalid attributes' unless validation.call(value)
      # raise 'Invalid attributes' unless yield(value) #还可以使用yield
      instance_variable_set("@#{attribute}", value)
    end
  end
end

class Person
  include CheckedAttributes

  attr_checked :age do |v|
    v >= 18
  end
end

class TestLoan < Minitest::Test
  def setup
    # add_checked_attribute(Person, :age) { |v| v >= 18 }
    @bob = Person.new
  end

  def test_accepts_valid_value
    @bob.age = 20
    assert_equal 20, @bob.age
  end

  # def test_refuses_nil_values
  #   assert_raises RuntimeError, 'Invalid attribute' do
  #     @bob.age = nil
  #   end
  # end
  #
  # def test_refuses_false_values
  #   assert_raises RuntimeError, 'Invalid attributes' do
  #     @bob.age = false
  #   end
  # end

  def test_refuses_invalid_values
    assert_raises RuntimeError, 'Invalid attributes' do
      @bob.age = 17
    end
  end
end

# def add_checked_attribute(clazz, attribute, &block)
#   # eval "
#   #   class #{clazz}
#   #     def #{attribute}
#   #       @#{attribute}
#   #     end
#   #
#   #     def #{attribute}=(value)
#   #       if value == nil || value == false
#   #         raise 'Invalid attributes'
#   #       end
#   #       @#{attribute} = value
#   #     end
#   #   end
#   # "
#
#
#   clazz.class_eval do
#     attribute = attribute.to_s
#     define_method "#{attribute}" do
#       instance_variable_get("@#{attribute}")
#     end
#
#     define_method "#{attribute}=" do |value|
#       # if value == nil || value == false
#       #   raise 'Invalid attributes'
#       # end
#       raise 'Invalid attributes' unless block.call(value)
#       # raise 'Invalid attributes' unless yield(value) #还可以使用yield
#       instance_variable_set("@#{attribute}", value)
#     end
#
#   end
# end
