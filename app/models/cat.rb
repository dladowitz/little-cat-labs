# == Schema Information
#
# Table name: cats
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  age        :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Cat < ActiveRecord::Base
  validates :name,    presence: true
  validates :user_id, numericality: true
  validates :age,     numericality: true, allow_blank: true

  belongs_to :user
  has_many   :weights


  def weight_amounts
    self.weights.map{ |weight| weight.amount }
  end

  def graph_points
    graph_points = []

    self.weights.each do |weight|
      graph_points << { x: weight.created_at.to_i, y: weight.amount }
    end

    graph_points
  end
end

