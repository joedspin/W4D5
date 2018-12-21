require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do 
    it "renders the user new" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do 
      let(:good_params) { { user: { username: "daviduser", password: "davidishot" } } }
      let(:bad_params) { { user: { username: "daviduser", password: "" } } }
      context "with valid params" do 
        it "creates a new user" do 
          post :create, params: good_params
          expect(User.last.username).to eq("daviduser")
        end 
      end 
      context "with invalid params" do 
        it "doesn't create a new user" do 
        post :create, params: bad_params
        expect(response).to render_template(:new)
      end 
    end
  end 
end