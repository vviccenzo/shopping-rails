class Produto < ApplicationRecord
    validates :preco, presence: true
    validates :nome, presence: true, length: { minimum: 3}
    #Se a descrição possui uma quantidade entre 5 caracteres e 200
    validates :descricao, presence: true, length: { in: 5..200}
    validates :quantidade, presence: true, length: { minimum: 1 }
    
    #Exemplos de validações

    # Se o campo cpf possui 11 caracteres
    # validates :cpf, length: { is: 11 }

    # Se o campo numero é um valor numérico do tipo inteiro
    # validates :numero, numericality: { only_integer: true }
end
