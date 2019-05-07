class User < ApplicationRecord
    has_many :orders, dependent: :destroy
    accepts_nested_attributes_for :orders

    validates :name, presence: true
    validates :cpf, presence: true
    validates :cpf, uniqueness: true


end
