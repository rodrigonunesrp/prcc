require 'rails_helper'

describe Admin::UsersController do
  let(:valid_attributes) { FactoryBot.build(:user).attributes.symbolize_keys }

  describe "GET index" do
    it "renders :index template" do
      get :index
      expect(response).to render_template(:index)
    end

    it "assigns all users as @users" do
      user = User.create! valid_attributes
      get :index
      expect(assigns(:users)).to eq([user])
    end
  end

  describe "GET new" do
    it "renders :new template" do
      get :new
      expect(response).to render_template(:new)
    end

    it "assigns a new User to @user" do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
  end

end
