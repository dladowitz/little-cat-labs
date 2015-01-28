require 'rails_helper'

describe CatsController do
  describe "POST create" do
    let(:user) { users(:volta) }
    before { login_user user}

    context "with valid params" do
      subject { post :create, user_id: user.id, cat: { name: "Aiko", age: 7} }

      it "creates a new cat record" do
        expect{ subject }.to change{ Cat.count }.by 1
      end

      it "creates a new record associated with the user account" do
        subject
        expect(assigns(:cat).user).to eq user
      end
    end

    context "with invalid params" do
      subject { post :create, user_id: user.id, cat: { name: nil, age: 7} }

      it "does NOT create a new cat record" do
        expect{ subject }.not_to change{Cat.count}
      end
    end
  end

  describe "GET edit" do
    let(:user) { users(:ohm) }
    let(:cat)  { user.cats.first }
    before { subject }

    context "when the cat is found in database" do
      subject { get :edit, user_id: user.id, id: cat.id }

      it "finds the cat in the database" do
        expect(assigns(:cat)).to eq cat
      end

      it "renders the edit template" do
        expect(response).to render_template :edit
      end

    end

    context "when the cat is NOT found in the database" do
      subject { get :edit, user_id: user.id, id: "Not a real id"  }

      it "does NOT find the cat in the database" do
        expect(assigns(:cat)).to eq nil
      end

      it "redirects to the user show page" do
        expect(response).to redirect_to user_path(user)
      end
    end
  end

  describe "PATCH update" do
    let(:user) { users(:ohm) }
    let(:cat)  { user.cats.first }
    before { subject }

    context "when the cat is found in database" do
      let(:params) { { name: "Dusty" } }
      subject { patch :update, user_id: user.id, id: cat.id, cat: params }

      it "finds the cat in the database" do
        expect(assigns(:cat)).to eq cat
      end

      context "with valid params" do
        it "updates the cat's attributes" do
          expect(cat.reload.name).to eq "Dusty"
        end
      end

      context "with invalid params" do
        let(:params) { { name: nil } }

        it "does NOT update the catss attributes" do
          expect(cat.reload.name).to eq "Aiko"
        end
      end
    end


    context "when the cat is NOT found in the database" do
      subject { patch :update, user_id: user.id, id: "Not a real ID", cat: { name: "Dusty" } }

      it "does NOT find the cat in the database" do
        expect(assigns(:cat)).to eq nil
      end

      it "redirects to the user show page" do
        expect(response).to redirect_to user_path(user)
      end
    end
  end
end
