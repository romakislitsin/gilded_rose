require_relative './brie'
require_relative './backstage'
require_relative './sulfuras'
require_relative './conjured'
require_relative './item_behavior'

class ItemFactory
  class << self
    # specialized types and their associated classes.
    # To add your specialized class, you need to add an element
    # to the hash and add +require_relative "%PATH_TO_FILE%"+
    ITEM_TYPES = {
        'Aged Brie' => Brie,
        'Backstage passes to a TAFKAL80ETC concert' => Backstage,
        'Sulfuras, Hand of Ragnaros' => Sulfuras,
        'Conjured Mana Cake' => Conjured
    }

    # creates ItemFactory instance with default +ItemBehavior+ class if
    # item doesn't have specializes type
    def create(item)
      type = ITEM_TYPES[item.name]
      type ? type.new(item) : ItemBehavior.new(item)
    end
  end
end