class Produto < ApplicationRecord
    validates :preco, presence: true
    validates :nome, presence: true, length: { minimum: 3}
    validates :descricao, presence: true, length: { minimum: 15}
    validates :quantidade, presence: true, length: { minimum: 1 }


end
