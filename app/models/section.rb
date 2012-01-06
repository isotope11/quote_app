class Section < Node
  def min_hours
    children.inject(0) { |sum, child| sum += child.min_hours }
  end

  def max_hours
    children.inject(0) { |sum, child| sum += child.max_hours }
  end

  def section?
    true
  end
end

