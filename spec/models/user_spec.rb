require 'rails_helper'
# require 'user'

describe User, :type => :model do 
    context "validate when name, cpf are included" do
        it "name must exist"
        it "cpf must exist"
        it "cpf must be unique"
        # user = User.new()
        # user.save
        # expect(user.errors.full_messages).to eq "Name must exist"
    end
end