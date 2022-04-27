class ProdutosController < ApplicationController

    def index
        #Ordenar os produtos por ordem alfabética
        @produtos = Produto.order(nome: :desc).limit 2


        #Ordenaros por preço, busca o menor preço e limita a apenas aparecer ele
        @produto_menor_preco = Produto.order(:preco).limit 1
    end

    def create
        #Recebe os dados do novo arquivo e insere na variavel 'produto'
        produto = params.require(:produto).permit(:nome, :descricao,:preco,:quantidade)
        #Cria um novo produto com os dados do arquivo e salva no banco de dados
        Produto.create produto
        #Redireciona para a página de produtos
        redirect_to root_path
    end
end
