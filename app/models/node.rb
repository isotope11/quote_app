class Node < ActiveRecord::Base
  validates_presence_of :description, :estimation

  def estimation_min
    estimation - 1
  end

  def estimation_max
    estimation + 1
  end
end
