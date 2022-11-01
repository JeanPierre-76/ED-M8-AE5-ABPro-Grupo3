class PoliticasController < ApplicationController
  before_action :set_politica, only: %i[ show edit update destroy ]

  # GET /politicas or /politicas.json
  def index
    @politicas = Politica.all
  end

  # GET /politicas/1 or /politicas/1.json
  def show
  end

  # GET /politicas/new
  def new
    @politica = Politica.new
  end

  # GET /politicas/1/edit
  def edit
  end

  # POST /politicas or /politicas.json
  def create
    @politica = Politica.new(politica_params)

    respond_to do |format|
      if @politica.save
        format.html { redirect_to politica_url(@politica), notice: "Politica was successfully created." }
        format.json { render :show, status: :created, location: @politica }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @politica.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /politicas/1 or /politicas/1.json
  def update
    respond_to do |format|
      if @politica.update(politica_params)
        format.html { redirect_to politica_url(@politica), notice: "Politica was successfully updated." }
        format.json { render :show, status: :ok, location: @politica }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @politica.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /politicas/1 or /politicas/1.json
  def destroy
    @politica.destroy

    respond_to do |format|
      format.html { redirect_to politicas_url, notice: "Politica was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_politica
      @politica = Politica.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def politica_params
      params.require(:politica).permit(:encabezado, :cuepor, :link)
    end
end
