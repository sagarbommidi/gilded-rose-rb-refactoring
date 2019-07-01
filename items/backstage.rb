class Backstage < ItemCategory
  def update_expired
    item.quality = 0
  end

  def update_quality
    increment_quality
    increment_quality if item.sell_in <= 10
    increment_quality if item.sell_in <= 5
  end
end
