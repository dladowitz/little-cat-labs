require 'rails_helper'

describe ApplicationController do
  describe "#current_user" do
    let(:user) { users :volta }

    subject { @controller.send(:current_user) }

    # can only use this if there is a route setup
    # subject { get :current_user }

    context "when there is a user logged in" do
      before { session[:user_id] = user.id }

      it "finds the correct user" do
        expect(subject).to eq user
      end
    end

    context "when there is not a user logged in" do
      it "returns nil" do
        expect(subject).to be_nil
      end
    end
  end
end


