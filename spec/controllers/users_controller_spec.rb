require 'rails_helper'

describe UsersController do
  describe "GET new" do
    subject { get :new }
    before { subject }

    it "renders the new template" do
      expect(response).to render_template :new
    end

    it "creates a new user object" do
      expect(assigns(:user)).to be_a_new User
    end
  end

  describe "POST create" do

    context "with valid params" do
      subject { post :create, user: {first_name: "Andre", email: "Andre.Ampere@gmail.com", password: "asdfasdf", password_confirmation: "asdfasdf" } }

      it "creates a new user in the database" do
        expect{ subject }.to change{ User.count }.by 1
      end
    end

    context "with INVALID params" do
      subject { post :create, user: {first_name: "Andre", email: nil, password: "asdfasdf", password_confirmation: nil } }

      it "does not create a new user in the database" do
        expect{ subject }.not_to change{ User.count }
      end

      it "renders the new template and landing page layout" do
        subject
        expect(response).to render_template :new
        expect(response).to render_template "landing_page/landing_layout"
      end
    end
  end

  describe "GET show" do
    let(:user) { create :user }

    context "with a logged in user" do
      before :each do
        #TODO create login helper method
        session[:user_id] = user.id
        subject
      end

      context "when the user is found in the database" do
        subject { get :show, { id: user.id } }

        it "renders the correct template" do
          expect(response).to render_template :show
        end

        it "find the correct user" do
          expect(assigns(:user)).to eq user
        end
      end

      context "when the user is not found in the database" do
        subject { get :show, { id: "not a real id" } }

        # not sure how this test is passing. ability.rb shoud be blocking access
        it "renders the show page" do
          expect(response).to redirect_to user_path(user)
        end

        it "does NOT find a user" do
          expect(assigns(:user)).to be_nil
        end
      end
    end
  end

  describe "GET profile" do
    let(:user) { create :user }

    context "with a logged in user" do
      before :each do
        session[:user_id] = user.id
        subject
      end

      context "when user is found in the database" do
        subject { get :profile, {id: user.id} }

        it "renders the correct template" do
          expect(response).to render_template :profile
        end

        it "finds the correct user" do
          expect(assigns(:user)).to eq user
        end
      end

      context "when user is not found in the database" do
        subject { get :profile, {id: "99999999"} }

        # not sure how this test is passing. ability.rb shoud be blocking access
        it "renders the show page" do
          expect(response).to redirect_to user_path(user)
        end

        it "doesn't find a user" do
          expect(assigns(:user)).to be_nil
        end
      end
    end
  end

  describe "PATCH update" do
    let(:user) {create :user}

    context "with a logged in user" do
      before :each do
        session[:user_id] = user.id
        subject
      end

      context "with valid params" do
        # subject { patch :update, id: user.id, user: {first_name: "Wayne", password: "123456", password_confirmation: "123456"} }
        subject { patch :update, id: user.id, user: {first_name: "Wayne"} }

        it "updates first name" do
          expect(user.reload.first_name).to eq "Wayne"
        end
      end

      context "with invalid params" do
        subject { patch :update, id: user.id, user: {first_name: "Wayne", password: "not matching", password_confirmation: "other"} }

        it "does not update first name" do
          expect(user.reload.first_name).not_to eq "Wayne"
        end
      end
    end
  end
end
