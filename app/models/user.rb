# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  first_name      :string(255)
#  last_name       :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  admin           :boolean
#  created_at      :datetime
#  updated_at      :datetime
#  scale_id        :integer
#  scale_password  :string(255)
#

class User < ActiveRecord::Base
  validates :first_name, presence: true
  validates :email,      presence: true, uniqueness: true
  validates :password,   presence: { on: create }, length: { minimum: 6 }, if: :password_digest_changed?

  before_validation :downcase_email, :if => Proc.new {|user| user.new_record? }

  has_secure_password

  has_many :cats

  private

  def downcase_email
    if self.email
      self.email = self.email.downcase
    end
  end
end
