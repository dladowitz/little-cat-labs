require 'rails_helper'

RSpec.describe WeightsController, :type => :controller do

  describe "GET create" do
    let(:cat) { cats :ohms_cat}
    let(:user) { cat.user }

    context "with valid params" do
      subject { get :create, user_id: user.id, cat_id: cat.id, weight: { amount: 10.50 } }

      it "returns redirect_to user page" do
        subject
        expect(response).to redirect_to user_path(user)
      end

      it "creates a new weight in the database" do
        expect{subject}.to change{Weight.count}.by 1
      end
    end
  end
end
