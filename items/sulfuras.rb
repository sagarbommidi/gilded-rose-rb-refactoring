class Sulfuras < ItemCategory
  def update_sellin
    # It never has to be sold
  end

  def update_expired
    # It is long lived, no expiration
  end

  def update_quality
    # Its quality is always 80, and never be altered.
    item.quality = 80
  end
end
