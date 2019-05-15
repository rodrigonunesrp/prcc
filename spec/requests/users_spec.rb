require 'rails_helper'

RSpec.describe "Users", :type => :request do
  describe "GET /admin/users" do
    it "check index page" do
      get admin_users_path
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /v1/users" do
    it "create user using api" do

      post v1_users_path, params: {user: FactoryBot.build(:user).attributes.symbolize_keys}
      expect(response).to have_http_status(201)
      expect(JSON.parse(response.body)["message"]).to eq("Cliente registrado com sucesso.")
      expect(JSON.parse(response.body)["user"]).to eq(JSON.parse(User.first.to_json))
    end
  end

end
