Dir["./items/*.rb"].each {|file| require file }

class GildedRose
  def initialize(items)
    @items = items
  end

  def categorize_item(item)
    if item.name =~ /^Aged Brie/
      AgedBrie.new(item)
    elsif item.name =~ /^Backstage/
      Backstage.new(item)
    elsif item.name =~ /^Sulfuras/
      Sulfuras.new(item)
    elsif item.name =~ /^Conjured/
      Conjured.new(item)
    else
      ItemCategory.new(item)
    end
  end

  def update_quality
    @items.each do |item|
      categorize_item(item).process!
    end
  end
end
