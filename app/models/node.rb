class Node < ActiveRecord::Base
  acts_as_nested_set
  validates_presence_of :description

  def estimation_min
    estimation - 1
  end

  def estimation_max
    estimation + 1
  end
end
