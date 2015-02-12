class Quote < Node
  def min_hours
    children.inject(0) { |sum, child| sum += child.min_hours }
  end

  def max_hours
    children.inject(0) { |sum, child| sum += child.max_hours }
  end

  def to_param
    uuid
  end

  def variance
    ((min_hours - max_hours).abs / 
      average_hours).round(2)
  end
end

