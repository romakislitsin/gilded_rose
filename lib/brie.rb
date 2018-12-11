require_relative './item_behavior'

class Brie < ItemBehavior
  # "Aged Brie" actually increases in Quality the older it gets
  def update
    update_quality(@item.quality + 1)
  end

  # executes the +decrease_quality+ if deadline has expired
  def process_expired
    update_quality(@item.quality + 1) if expired?
  end
end
