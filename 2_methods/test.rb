require 'minitest/autorun'
require 'ds'
require '2_dynamic_dispatch_and_dynamic_method'
require '3_method_missing'


class Test < Minitest::Test
  def test_ds
    ds = Ds.new
    assert(ds.get_mouse_info(1) != nil)
    assert(ds.get_mouse_price(1) != nil)
    assert(ds.get_cpu_info(1) != nil)
    assert(ds.get_cpu_price(1) != nil)
    assert(ds.get_keyboard_info(1) != nil)
    assert(ds.get_keyboard_price(1) != nil)
    assert(ds.get_display_info(1) != nil)
    assert(ds.get_display_price(1) != nil)
  end

  def test_computer
    ds = Ds.new
    computer = Computer.new(1, ds)
    assert computer.mouse.include? 'Mouse'
    assert computer.cpu.include? 'Cpu'
    assert computer.keyboard.include? 'Keyboard'
    assert computer.display.include? 'Display'
  end

  def test_other_computer
    ds = Ds.new
    computer = Other::Computer.new(1, ds)
    assert computer.mouse.include? 'Mouse'
    assert computer.cpu.include? 'Cpu'
    assert computer.keyboard.include? 'Keyboard'
    assert computer.display.include? 'Display'
  end
end
