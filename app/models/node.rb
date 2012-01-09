class Node < ActiveRecord::Base
  acts_as_nested_set
  validates_presence_of :description

  def root_node
    ancestors.first || self
  end
end
