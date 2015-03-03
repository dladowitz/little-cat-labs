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

    context "with a token not found in the database" do
      subject { get :reset_password, token: "not a real token" }

      it "renders the request_password template" do
        subject
        expect(response).to render_template :request_password
      end

      it "shows a flash message" do
        subject
        expect(flash[:danger]).to eq "Invalid password request link. Maybe request a new password reset link."
      end
    end
  end

  describe "PATCH update" do
    let(:password_reset) { create :password_reset}
    let(:user) { password_reset.user }

    # should probably validate token again. Otherwise anyone could update the password
    context "with valid paramaters" do
      subject { patch :update, token: password_reset.token, user: { password: "123456", password_confirmation: "123456" } }

      it "updates the password" do
        subject
        expect(user.reload.authenticate("123456")).to eq user
      end

      it "redirects to the sign_in page" do
        subject
        expect(response).to redirect_to signin_path
      end

      it "displays a flash message" do
        subject
        expect(flash[:success]).to eq "Password updated. Try it out by signing in."
      end

      it "finds the correct password_reset" do
        subject
        expect(assigns(:password_reset)).to eq password_reset
      end

      it "updates the used column in password reset" do
        subject
        expect(password_reset.reload.used).to be_an_instance_of ActiveSupport::TimeWithZone
      end

    end

    context "with invalid parameters" do
      context "with an invalid password" do
        subject { patch :update, token: password_reset.token, user: { password: "1", password_confirmation: "1" } }

        it "renders the reset_password template" do
          subject
          expect(response).to render_template :reset_password
        end

        it "shows errors on the model" do
          subject
          expect(assigns(:user).errors[:password].first).to eq "is too short (minimum is 6 characters)"
        end
      end

      context "with an invalid token" do
        subject { patch :update, token: "not a token", user: { password: "1", password_confirmation: "1" } }

        it "renders the request_password template" do
          subject
          expect(response).to render_template :request_password
        end

        it "displays a flash message" do
          subject
          expect(flash[:danger]).to eq "Invalid link."
        end
      end
    end
  end
end
