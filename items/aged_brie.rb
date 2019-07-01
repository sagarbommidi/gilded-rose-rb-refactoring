class AgedBrie < ItemCategory
  def update_expired
    increment_quality
  end

  def update_quality
    increment_quality
  end
end
