require 'rails_helper'
require_relative '../support/new_user_form'

feature 'admin user index' do 
    scenario 'when no users found' do
        visit('/')
        expect(page).to have_content("Clientes\nListarNovo\nListando Clientes\nNão há usuários para exibir\nAdicione um agora")
    end

    scenario 'when users found' do
        times = 1
        user = create_list(:user_with_orders, times)

        expect(user.first).to be_valid
        expect(user.first.orders.first).to be_valid
        visit('/')

        # COLUMNS
        expect(page).to have_content("IDNomeCPFEmailModeloIMEIPreço AnualQtd. Parcelas")

        # ROWS
        expect(page).to have_content(user.pluck(:name, :cpf, :email).join())
    end

    scenario 'check index page links' do
        visit('/')
        click_on('Clientes')
        expect(current_path).to eq '/'
        click_on('Listar')
        expect(current_path).to eq '/'
        click_on('Novo')
        expect(current_path).to eq '/admin/users/new'
    end
end

feature 'admin user new' do 
    let(:new_user_form) { NewUserForm.new }
    
    scenario 'verify fields displayed' do
        visit(new_admin_user_url)
        expect(page).to have_content("Clientes\nListarNovo\nCriar Novo Cliente\nCliente\nNome *\nCPF *\nEmail\nAssinatura\nModelo *\nIMEI *\nPreço Anual *\nQtd. de Parcelas")
    end

    scenario 'when no input data' do
        new_user_form.visit_page.submit
        expect(page).not_to have_content('Cliente registrado com sucesso.')
        expect(page).to have_content("{\"errors\":[\"Assinatura campo Modelo não pode ficar em branco\",\"Assinatura campo IMEI não pode ficar em branco\",\"Assinatura campo Preço Anual não pode ficar em branco\",\"Nome não pode ficar em branco\",\"CPF não pode ficar em branco\"],\"message\":\"Houve um erro ao tentar salvar os dados, verifique e tente novamente.\"}")
    end

    scenario 'when have input data' do
        new_user_form.visit_page.fill_in_with().submit
        expect(page).to have_content('Cliente registrado com sucesso.')
    end
end
