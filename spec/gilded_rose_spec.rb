require_relative '../gilded_rose'

describe GildedRose do

  describe '#update_quality' do
    it 'does not change the name' do
      items = [Item.new('foo', 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq 'foo'
    end
    context 'item is normal' do
      it 'reduces item quality by 1' do
        items = [Item.new('foo', 1, 1)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 0
      end
      it 'reduces quality by 2 if sell_in < 0' do
        items = [Item.new('foo', -1, 2)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality). to eq 0
      end
      it 'reduces quality by 1 if sell_in < 0 and item quality is 1' do
        items = [Item.new('foo', -1, 0)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality). to eq 0
      end
    end
    context 'item is Sulfuras, Hand of Ragnaros' do
      it 'does not reduce in quality' do
        items = [Item.new('Sulfuras, Hand of Ragnaros', 0, 80)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 80
      end
      context 'sell_in is < 0' do
        it 'does not reduce in quality when sell_in is < 0' do
          items = [Item.new('Sulfuras, Hand of Ragnaros', -1, 80)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 80
        end
      end
    end
    context 'item is Aged Brie' do
      context 'item quality is < 50' do
        it 'increases quality by 1' do
          items = [Item.new('Aged Brie', 2, 49)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 50
        end
        context 'sell_in is less then 0' do
          it 'increases quality by 2' do
            items = [Item.new('Aged Brie', -1, 40)]
            GildedRose.new(items).update_quality()
            expect(items[0].quality).to eq 42
          end
        end
      end
      context 'item quality is greater then 50' do
        it 'doesn\'t increase quality' do
          items = [Item.new('Aged Brie', -1, 49)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 50
        end
      end
    end
    context 'item is Backstage pass' do
      context 'sell_in is 0 or less' do
        it 'has a quality of 0' do
          items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 0, 47)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 0
        end
      end
      context 'sell_in is 5 or less but above 0' do
        it 'increases quality by 3 when quality is 47' do
          items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 47)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 50
        end
        it 'increases Backstage passes quality by 1 when quality is 49' do
          items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 49)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 50
        end
      end
      context 'sell_in is above 5 but less then 11' do
        it 'increases quality by 2 when quality is 48' do
          items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 48)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 50
        end
        it 'increases quality by 1 when quality is 49' do
          items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 49)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 50
        end
      end
      context 'sell_in is 11 or higher' do
        it 'increases quality by 1 when quality is 40' do
          items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 11, 40)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 42
        end
        it 'doesn\'t increase quality by 1 when quality is 50' do
          items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 11, 50)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 50
        end
      end
    end
    context 'item is normal and sell_in < 0' do
      it 'reduces quality by 1' do
        items = [Item.new('normal_item', -1, 1)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 0
      end
    end
    context 'item is normal and sell_in > 0' do
      it 'reduces quality by 1' do
        items = [Item.new('normal_item', 2, 2)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 1
      end
    end
    context 'item is normal and sell_in < 0' do
      it 'reduces quality by 2' do
        items = [Item.new('normal_item', -1, 2)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 0
      end
    end
    describe 'ConjuredItem' do
      it 'reduces sell_in by 1' do
        items = [Item.new('Conjured Mana Cake', 0, 4)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq -1
      end
      context 'sell_in is 0' do
        it 'reduces quality by 2' do
          items = [Item.new('Conjured Mana Cake', 0, 4)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 0
        end
      end
      context 'sell_in is -1' do
        it 'reduces quality by 4' do
          items = [Item.new('Conjured Mana Cake', -1, 4)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 0
        end
      end
    end
  end
end
