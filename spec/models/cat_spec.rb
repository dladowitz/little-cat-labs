require 'rails_helper'

describe Cat do
  it { should validate_presence_of :name }
  it { should validate_numericality_of :user_id }
  it { should validate_numericality_of :age }

  it { should belong_to :user }
end
