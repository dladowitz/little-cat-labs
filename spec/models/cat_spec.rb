require 'rails_helper'

describe Cat do
  it { should validate_presence_of :name }
  it { should validate_numericality_of :user_id }
  it { should validate_numericality_of :age }

  it { should belong_to :user }
  it { should have_many :weights }

  describe "#weight_amounts" do
    before :each do
      @cat = cats :ohms_cat
      @weight_1 = create :weight, cat: @cat
      @weight_2 = create :weight, cat: @cat
      @weight_3 = create :weight, cat: @cat
    end

    subject { @cat.weight_amounts }

    it "should return an array of weight amounts" do
      expect(subject).to match_array [@weight_1.amount, @weight_2.amount, @weight_3.amount]
    end
  end
end
