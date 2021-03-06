# == Schema Information
#
# Table name: registrations
#
#  id         :integer          not null, primary key
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Registration < ActiveRecord::Base
  validates :email, presence: true
end
