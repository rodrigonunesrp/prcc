require 'rails_helper'

describe V1::UsersController do
  let(:valid_attributes) { FactoryBot.build(:user).attributes.symbolize_keys }

  context "with valid params" do
    it "creates a new User" do
      expect {
        post :create, params: { user: valid_attributes }
      }.to change(User, :count).by(1)
    end
        
    it "success message after create user" do
      post :create, params: { user: valid_attributes } 
      expect(response.status).to eq(201)
      expect(JSON.parse(response.body)["message"]).to eq("Cliente registrado com sucesso.")
      expect(JSON.parse(response.body)["user"]).to eq(JSON.parse(User.first.to_json))
    end
  end

  let(:invalid_attributes) { FactoryBot.attributes_for(:user, cpf: nil) }
  context "with invalid params" do
    it "doesn't create new user at database" do
      expect {
        post :create, params: { user: invalid_attributes } 
      }.to_not change(User, :count)
      expect(response.status).to eq(422)
      expect(JSON.parse(response.body)["message"]).to eq("Houve um erro ao tentar salvar os dados, verifique e tente novamente.")
    end

  end

end
