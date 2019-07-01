class Conjured < ItemCategory
  def update_expired
    decrement_quality
    decrement_quality
  end

  def update_quality
    decrement_quality
    decrement_quality
  end
end
