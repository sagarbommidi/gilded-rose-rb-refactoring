require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do
  describe '#update_quality' do
    it 'does not change the name' do
      items = [Item.new('foo', 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq 'foo'
    end

    context 'sell by date' do
      it 'should reduce the quality by 1 if the sell by date more than zero' do
        items = [Item.new('foo', 10, 15)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 14
        expect(items[0].sell_in).to eq 9
      end

      it 'should reduce the quality twice if sell by date has passed' do
        items = [Item.new('foo', 1, 15)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 14
        expect(items[0].sell_in).to eq 0

        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 12
        expect(items[0].sell_in).to eq -1
      end
    end

    context 'Conjured Item' do
      it 'should degrade in Quality twice as fast as normal items' do
        items = [Item.new('Conjured', 1, 15)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 13
        expect(items[0].sell_in).to eq 0
      end

      it 'should degrare twice fast if sell by date has passed' do
        items = [Item.new('Conjured', 0, 15)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 11
        expect(items[0].sell_in).to eq -1
      end
    end

    context 'Backstage passes' do
      it 'should increase quality by 1 if sell by dates more than 10' do
        items = [Item.new('Backstage passes', 13, 15)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 16
        expect(items[0].sell_in).to eq 12
      end

      it 'should increase quality by 2 if sell by dates less than 11 and above 5' do
        items = [Item.new('Backstage passes', 9, 15)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 17
        expect(items[0].sell_in).to eq 8
      end

      it 'should increase quality by 3 if sell by dates less than 6 and above 0' do
        items = [Item.new('Backstage passes', 4, 15)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 18
        expect(items[0].sell_in).to eq 3
      end

      it 'should degrade the quality to 0 if sell by dates has passed' do
        items = [Item.new('Backstage passes', 0, 15)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 0
        expect(items[0].sell_in).to eq -1
      end
    end

    context 'Aged Brie' do
      it 'should increase the quality when it gets older' do
        items = [Item.new('Aged Brie', 4, 15)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 16
        expect(items[0].sell_in).to eq 3
      end

      it 'should not have quality more than 50' do
        items = [Item.new('Aged Brie', 4, 49)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 50
        expect(items[0].sell_in).to eq 3

        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 50
        expect(items[0].sell_in).to eq 2
      end
    end

    context 'Sulfuras, Hand of Ragnaros' do
      it 'should always contains its quality to 80' do
        items = [Item.new('Sulfuras, Hand of Ragnaros', 5, 35)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 80
        expect(items[0].sell_in).to eq 5
      end
    end
  end
end
