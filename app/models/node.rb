class Node < ActiveRecord::Base
  acts_as_nested_set
  validates_presence_of :description, :uuid
  before_validation :generate_uuid

  def root_node
    ancestors.first || self
  end

  def average_hours
    avg_hrs = (self.min_hours + self.max_hours) / 2.0
    avg_hrs.round.to_f
  end

  def generate_uuid
    self.uuid ||= UUID.generate :compact
  end
end
