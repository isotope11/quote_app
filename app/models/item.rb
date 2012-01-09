class Item < Node
  validate :parent, :parent_must_be_section

  def parent_must_be_section
    if parent.type != 'Section'
      errors.add :parent, 'must be a section'
    end
  end
end
