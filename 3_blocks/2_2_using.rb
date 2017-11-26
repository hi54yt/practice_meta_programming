module Kernel
  # 块把局部变量携带出原作用域
  def using(resource)
    begin
      yield
    ensure
      resource.dispose
    end
  end
end
