require_relative './item_behavior'

class Backstage < ItemBehavior
  # "Backstage passes", like aged brie, increases in Quality
  # as its SellIn value approaches;
  # Quality increases by 2 when there are 10 days or less
  # and by 3 when there are 5 days or less
  def update
    case @item.sell_in
    when 0..6
      increase_quality = 3
    when 6..11
      increase_quality = 2
    else
      # Brie, Backstage and Sulfuras increase 1 by default
      increase_quality = 1
    end
    update_quality(@item.quality + increase_quality)
  end

  # Quality drops to 0 after the concert
  def process_expired
    @item.quality = 0 if expired?
  end
end
