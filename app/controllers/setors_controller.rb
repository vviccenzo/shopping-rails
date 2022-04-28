class SetorsController < ApplicationController
  before_action :set_setor, only: %i[ show edit update destroy ]

  # GET /setors or /setors.json
  def index
    @setors = Setor.all
  end

  # GET /setors/1 or /setors/1.json
  def show
    @produtos_por_setor = Produto.where("setor_id = ?", params[:id])
  end

  # GET /setors/new
  def new
    @setor = Setor.new
  end

  # GET /setors/1/edit
  def edit
  end

  # POST /setors or /setors.json
  def create
    @setor = Setor.new(setor_params)

    respond_to do |format|
      if @setor.save
        format.html { redirect_to setor_url(@setor), notice: "Setor was successfully created." }
        format.json { render :show, status: :created, location: @setor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @setor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /setors/1 or /setors/1.json
  def update
    respond_to do |format|
      if @setor.update(setor_params)
        format.html { redirect_to setor_url(@setor), notice: "Setor was successfully updated." }
        format.json { render :show, status: :ok, location: @setor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @setor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /setors/1 or /setors/1.json
  def destroy
    @setor.destroy

    respond_to do |format|
      format.html { redirect_to setors_url, notice: "Setor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_setor
      @setor = Setor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def setor_params
      params.require(:setor).permit(:nome)
    end
end
