def monthly_sales
  110 # 从数据库中读取真实的数据
end

target_sales = 100

event "monthly sales are suspiciously high" do
  monthly_sales > target_sales
end

event "monthly sales are abysmally low" do
  monthly_sales < target_sales
end

# setup do
#   define_singleton_method(:monthly_sales) do
#     110
#   end
#
#   @target_sales = 100
# end
