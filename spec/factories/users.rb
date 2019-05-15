FactoryBot.define do
    
    factory :order do
        model {'teste'}
        imei {'1212312123'}
        anual_price {'399.99'}
        payment_number_of_quotas {'12'}
        user
    end

    factory :user do
        name { 'teste' }
        sequence(:cpf) { |n| "#{n.times {rand(11111111111..99999999999)} }" }
        email { 'teste@teste.com' }    
        
        factory :user_with_orders do
            transient do
                orders_count { 1 }
            end
            
            after(:create) do |user, evaluator|
                create_list(:order, evaluator.orders_count, user: user)
            end
        end
    end

end