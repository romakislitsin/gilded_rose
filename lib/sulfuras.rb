require_relative './item_behavior'

class Sulfuras < ItemBehavior
  # "Sulfuras" is a legendary item and as such its
  # Quality is 80 and it never alters.
  def update
  end

  def process_expired
  end

  def decrease_sell_in
  end
end
