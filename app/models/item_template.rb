class ItemTemplate < ActiveRecord::Base
  def to_s
    description
  end
end
