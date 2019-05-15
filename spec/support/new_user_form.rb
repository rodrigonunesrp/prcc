class NewUserForm
    include Capybara::DSL

    def visit_page
        visit('/')
        click_on('Novo')
        self
    end

    def fill_in_with(params = {})
        fill_in('Nome', with: params.fetch(:name, 'Teste'))
        fill_in('CPF', with: params.fetch(:cpf, '12345678900'))
        fill_in('Email', with: params.fetch(:email, 'teste@teste.com.br'))
        fill_in('Modelo', with: params.fetch(:model, 'Teste'))
        fill_in('IMEI', with: params.fetch(:imei, '1234512345'))
        fill_in('Preço Anual', with: params.fetch(:anual_price, '399.99'))
        fill_in('Qtd. de Parcelas', with: params.fetch(:payment_number_of_quotas, '10'))

        self
    end

    def submit
        click_on('Criar Usuário')
        self
    end
end