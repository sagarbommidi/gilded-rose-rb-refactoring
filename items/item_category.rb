class ItemCategory
  attr_accessor :item
  def initialize(item)
    @item = item
  end

  def increment_quality
    item.quality = item.quality + 1 if item.quality < 50
  end

  def decrement_quality
    item.quality = item.quality - 1 if item.quality > 0
  end

  def update_sellin
    item.sell_in = item.sell_in - 1
  end

  def update_expired
    decrement_quality
  end

  def update_quality
    decrement_quality
  end

  def process!
    update_sellin
    update_quality
    update_expired if item.sell_in < 0
  end

end
