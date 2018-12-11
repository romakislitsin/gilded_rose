class ItemBehavior
  MAX_QUALITY = 50

  # ItemBehavior.new(item)
  # returns a new instance
  def initialize(item)
    @item = item
  end

  # updates quality of item
  def update
    update_quality(@item.quality - 1)
  end

  def update_quality(quality)
    @item.quality = quality <= MAX_QUALITY ? quality : 50
  end

  # reduces quality by one point by default
  # stops the decline if the quality has reached 0
  def decrease_quality
    @item.quality -= 1 if @item.quality > 0
    @item.quality = 0 if @item.quality < 0
  end

  # executes the +decrease_quality+ if deadline has expired
  def process_expired
    decrease_quality if expired?
  end

  # reduces the sell_in by 1
  def decrease_sell_in
    @item.sell_in -= 1
  end

  # return +true+ if the deadline has expired
  def expired?
    @item.sell_in < 0
  end
end
