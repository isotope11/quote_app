class Section < Node
  belongs_to :quote
  def min_hours
    children.sum :min_hours
  end

  def max_hours
    children.sum :max_hours
  end
end

