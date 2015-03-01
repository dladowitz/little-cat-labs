require 'rails_helper'

describe PasswordResetsController do
  describe "GET request_password" do
    subject { get :request_password }

    it "should render the request_password template" do
      subject
      expect(response).to render_template :request_password
    end
  end

  describe "POST create" do
    let(:user) { create :user }

    context "when email is found in the database" do
      subject { post :create, email: user.email }

      it "creates a new record in the database" do
        expect{ subject }.to change{ PasswordReset.count }.by 1
      end

      it "renders the email_sent template" do
        subject
        expect(response).to render_template :email_sent
      end
    end

    context "when email is NOT found in the database" do
      subject { post :create, email: "not a real email" }

      it "does NOT create a new record in the database" do
        expect{ subject }.not_to change{ PasswordReset.count }
      end

      it "re-renders the request_password template" do
        subject
        expect(response).to render_template :request_password
      end

      it "displays a flash message" do
        subject
        expect(flash[:danger]).to eq "Email address not found."
      end
    end

  end
end
