require 'rails_helper'

describe Weight do
  it { should validate_numericality_of :amount }
  it { should validate_numericality_of :cat_id }
  it { should belong_to :cat }


  it "has a valid factory" do
    expect(create :weight).to be_a_kind_of Weight
  end
end
