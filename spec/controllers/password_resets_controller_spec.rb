require 'rails_helper'

describe PasswordResetsController do
  describe "GET request_password" do
    subject { get :request_password }

    it "should render the request_password template" do
      subject
      expect(response).to render_template :request_password
    end
  end
end
