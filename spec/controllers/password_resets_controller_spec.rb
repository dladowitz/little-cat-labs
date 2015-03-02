require 'rails_helper'

describe PasswordResetsController do
  describe "GET request_password" do
    subject { get :request_password }

    it "should render the request_password template" do
      subject
      expect(response).to render_template :request_password
    end
  end

  describe "POST create"

  describe "GET reset_password" do
    let(:password_reset) { create :password_reset}
    let(:user)           { password_reset.user }

    context "with a token found in the database" do
      context "when the password hasn't been reset yet" do
        subject { get :reset_password, token: password_reset.token }

        it "renders the reset_password template" do
          subject
          expect(response).to render_template :reset_password
        end

        it "finds the correct user" do
          subject
          expect(assigns(:user)).to eq user
        end
      end

      context "when the password has already been reset" do
        before { password_reset.update used: Time.now }
        subject { get :reset_password, token: password_reset.token }

        it "renders the already_used template" do
          subject
          expect(response).to render_template :already_used
        end

        it "finds the correct user" do
          subject
          expect(assigns :user).to eq user
        end
      end
    end
  end
end
