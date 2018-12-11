require_relative 'lib/item_factory'

class GildedRose
  # GildedRose.new(items)
  # returns a new instance
  def initialize(items)
    @items = items
  end

  # gilded_rose.update_quality
  # updates sell_in and quality for every item in collection
  # returns +self+
  def update_quality
    @items.map do |item|
      gilded_item = ItemFactory.create(item)
      gilded_item.update
      gilded_item.decrease_sell_in
      gilded_item.process_expired
    end
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end