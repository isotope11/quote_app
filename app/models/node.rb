class Node < ActiveRecord::Base
  acts_as_nested_set
  validates_presence_of :description

  def root_node
    ancestors.first || self
  end

  def average_hours
    (self.min_hours + self.max_hours) / 2
  end
end
