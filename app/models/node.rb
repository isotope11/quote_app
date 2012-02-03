class Node < ActiveRecord::Base
  acts_as_nested_set
  validates_presence_of :description, :uuid
  validates_uniqueness_of :uuid
  before_validation :generate_uuid

  attr_accessible :description, :parent_id, :min_hours, :max_hours, :item_template_id, :processed, :xrono_id

  def average_hours
    avg_hrs = (self.min_hours + self.max_hours) / 2.0
    avg_hrs.round.to_f
  end

  def generate_uuid
    if self.new_record?
      self.uuid = UUID.generate :compact
    else
      self.uuid ||= UUID.generate :compact
    end
  end

  # initialize a dup of the node with descendants
  def dup_branch
    # start at the root
    h = { self => self.dup }

    ordered = self.descendants

    # clone subitems
    ordered.each do |item|
      h[item] = item.dup
    end

    # resolve relations
    ordered.each do |item|
      cloned = h[item]
      item_parent = h[item.parent]
      item_parent.children << cloned if item_parent
    end

    h[self]
  end
end
