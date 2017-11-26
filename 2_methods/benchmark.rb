class String
  def method_missing(method, *args)
    # method == :ghost_reverse ? reverse : super

    # 当第一次调用幽灵方法时，为它创建一个动态方法。
    if method == :ghost_reverse
      String.class_eval do
        define_method(method) {
          reverse
        }
      end
    else
      super
    end
  end

  require 'benchmark'

  Benchmark.bm do |b|
    b.report 'Normal method' do
      1000000.times {'abc'.reverse}
    end
  end

  Benchmark.bm do |b|
    b.report 'Ghost method' do
      1000000.times {'abc'.ghost_reverse}
    end
  end
end
