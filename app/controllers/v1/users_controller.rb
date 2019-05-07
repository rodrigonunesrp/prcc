class V1::UsersController < ApplicationController
  def create
    response = UserService.new(user: user_params).perform
    if response[:valid]
      render json: { user: response[:user], message: "Cliente registrado com sucesso." }.to_json, status: :created
    else
      render json: { errors: response[:error], message: "Houve um erro ao tentar salvar os dados, verifique e tente novamente." }.to_json, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :cpf, :email, orders_attributes: [ :model, :imei, :anual_price, :payment_number_of_quotas ])
  end
end
