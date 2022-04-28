class ProdutosController < ApplicationController

    def index
        #Ordenar os produtos por ordem alfabética com um limite de 6 produtos por página
        @produtos = Produto.order(nome: :asc).limit 6


        #Ordenaros por preço, busca o menor preço e limita a apenas aparecer ele
        @produto_menor_preco = Produto.order(:preco).limit 1
    end

    def create
        #Recebe os dados do novo arquivo e insere na variavel 'produto'
        produto = params.require(:produto).permit(:nome, :descricao,:preco,:quantidade)
        #Cria um novo produto com os dados do arquivo e salva no banco de dados
        Produto.create produto
        #Redireciona para a página de produtos
        redirect_to root_url
    end

    def busca
        #Instancia o nome como uma variavel global, e recebe os parametros de nome
        @nome = params[:nome]
        #Adicionando as porcentagens para que o nome seja buscado como parte do nome
        #Instancia o produtos como uma variavel global e passa a Query where com o nome
        #"nome like?" para indicar que o nome deve ser buscado como parte do nome e evitar SQL Injection
        @produtos = Produto.where "nome like ?", "%#{@nome}%"
    end

    def destroy
        id = params[:id]
        Produto.destroy id
        redirect_to root_url
    end
end
