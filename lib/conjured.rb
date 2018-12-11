require_relative './item_behavior'

class Conjured < ItemBehavior
  # "Conjured" items degrade in Quality twice as fast as normal items
  def update
    update_quality(@item.quality - 2)
  end

  # executes the +decrease_quality+ if deadline has expired
  def process_expired
    2.times { decrease_quality } if expired?
  end
end
