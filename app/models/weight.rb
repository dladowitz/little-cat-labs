# == Schema Information
#
# Table name: weights
#
#  id         :integer          not null, primary key
#  amount     :float
#  cat_id     :integer
#  created_at :datetime
#  updated_at :datetime
#

class Weight < ActiveRecord::Base
  validates_numericality_of :amount, :cat_id


  belongs_to :cat

end
