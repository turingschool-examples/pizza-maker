require 'pry'

class Customer

  def initialize(name, address, phone)
    @profile = {:name => name,
                :address => address,
                :phone => phone }
    @orders = []
  end

  def profile
    @profile
  end

  def place_order(pizza, time)
    @orders << {:pizza => pizza, :time => time.to_date}
  end

  def order_in_place?
    @orders.count > 0
  end

  def order_frequency
    @orders.count
  end

  def frequent_customer?
    @orders.count >=3 && ordered_in_last_30_days?
  end

  def ordered_in_last_30_days?
    (@orders[-1][:time] - @orders[-3][:time]).abs.to_i <= 30
  end

end