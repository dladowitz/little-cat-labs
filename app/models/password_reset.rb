# == Schema Information
#
# Table name: password_resets
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  token      :integer
#  created_at :datetime
#  updated_at :datetime
#

class PasswordReset < ActiveRecord::Base
  validates :user_id, :token,  presence: true

  belongs_to :user
end
