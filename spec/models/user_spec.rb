require 'rails_helper'

describe User, :type => :model do 
    context "validate when name, cpf are included" do
        it "name must exist" do
            user = FactoryBot.build(:user, name: nil)
            user.save
            expect(user.errors.full_messages.first).to eq "Nome não pode ficar em branco"
        end

        it "cpf must exist" do
            user = FactoryBot.build(:user, cpf: nil)
            user.save
            expect(user.errors.full_messages.first).to eq "CPF não pode ficar em branco"
        end

        it "cpf must be unique" do
            user_first = FactoryBot.create(:user)
            user = FactoryBot.build(:user, cpf: user_first.cpf)
            user.save
            expect(user.errors.full_messages.first).to eq "CPF já está em uso"
        end
    end
end