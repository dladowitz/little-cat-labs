require 'rails_helper'

describe PasswordReset do
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :token }
  it { should belong_to :user }

  it "has a valid factory" do
    expect(create :password_reset).to be_an_instance_of PasswordReset
  end
end
