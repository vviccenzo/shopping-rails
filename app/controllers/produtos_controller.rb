class ProdutosController < ApplicationController

    #Antes de qualquer função ex:. edit, update... Ele irá executar a função set_produto que irá buscar os parametros do arquivo
    before_action :set_produto, only: [:edit, :update, :destroy]

    def index
        #Ordenar os produtos por ordem alfabética com um limite de 6 produtos por página
        @produtos = Produto.order(nome: :asc).limit 6

        #Ordenaros por preço, busca o menor preço e limita a apenas aparecer ele
        @produto_menor_preco = Produto.order(:preco).limit 1
    end

    #Função que sempre que entrar na página irá setar um novo produto
    def new
        #Instancia o produto como uma variavel global
        @produto = Produto.new
        @setores = Setor.all  #Para exibir os setores no select
    end

    def create
        #Recebe os dados do novo arquivo e insere na variavel 'produto'
        #Cria um novo produto com os dados do arquivo e salva no banco de dados
        @produto = Produto.new produto_params
        if @produto.save
            #Se salvar com sucesso, renderiza uma mensagem de sucesso
            flash[:notice] = "Produto salvo com sucesso!"
            #Redireciona para a página de produtos
            redirect_to root_url
        else
            #Redireciona novamente para a página de criação de produtos
            renderize :new
        end
    end

    def busca
        #Instancia o nome como uma variavel global, e recebe os parametros de nome
        @nome = params[:nome]
        #Adicionando as porcentagens para que o nome seja buscado como parte do nome
            #Instancia o produtos como uma variavel global e passa a Query where com o nome
            #"nome like?" para indicar que o nome deve ser buscado como parte do nome e evitar SQL Injection
        @produtos = Produto.where "nome like ?", "%#{@nome}%"
    end

    def edit
        #Após receber os parametros do produto no before_action com a função set_produto, ele faz a ediçã
        renderize :edit
    end

    def update
        if @produto.update produto_params
            flash[:notice] = "Produto atualizado com sucesso!"
            redirect_to root_url
        else
            renderize :edit
        end
    end

    def destroy
        #Após receber os parametros do produto no before_action com a função set_produto, ele faz a exclusão
        @produto.destroy
        redirect_to root_url
    end

    private
    #Função que recebe os parametros do arquivo e retorna um hash
    def produto_params
        #Recebe os parametros do arquivo
        params.require(:produto).permit(:nome, :descricao,:preco,:quantidade, :setor_id)
    end

    #Função que seta os parametros do arquivo
    def set_produto
        id = params[:id]
        # @produto recebe os dados do produto com o id passado
        @produto = Produto.find(params[:id])
    end


    #Função que renderiza a página de criação de produtos
    def renderize(view)
        @setores = Setor.all
        render view
    end

end
