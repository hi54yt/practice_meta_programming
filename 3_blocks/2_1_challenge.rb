require '2_2_using'
require 'minitest/autorun'

class TestUsing < Minitest::Test
  class Resource
    def dispose
      @disposed = true
    end

    def disposed?
      @disposed
    end
  end

  def test_dispose_of_resources
    r = Resource.new
    using(r) {}
    assert r.disposed?
  end

  def test_dispose_of_resources_in_case_of_exception
    r = Resource.new
    assert_raises(Exception) {
      using(r) {
        raise Exception
      }
    }
    assert r.disposed?
  end
end