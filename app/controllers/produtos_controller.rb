class ProdutosController < ApplicationController

    def index
        #Ordenar os produtos por ordem alfabética
        @produtos = Produto.order(nome: :desc).limit 2


        #Ordenaros por preço, busca o menor preço e limita a apenas aparecer ele
        @produto_menor_preco = Produto.order(:preco).limit 1
    end
end
