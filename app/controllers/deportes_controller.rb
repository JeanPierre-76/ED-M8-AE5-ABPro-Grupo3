class DeportesController < ApplicationController
  before_action :set_deporte, only: %i[ show edit update destroy ]

  # GET /deportes or /deportes.json
  def index
    @deportes = Deporte.all
  end

  # GET /deportes/1 or /deportes/1.json
  def show
  end

  # GET /deportes/new
  def new
    @deporte = Deporte.new
  end

  # GET /deportes/1/edit
  def edit
  end

  # POST /deportes or /deportes.json
  def create
    @deporte = Deporte.new(deporte_params)

    respond_to do |format|
      if @deporte.save
        format.html { redirect_to deporte_url(@deporte), notice: "Deporte was successfully created." }
        format.json { render :show, status: :created, location: @deporte }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @deporte.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deportes/1 or /deportes/1.json
  def update
    respond_to do |format|
      if @deporte.update(deporte_params)
        format.html { redirect_to deporte_url(@deporte), notice: "Deporte was successfully updated." }
        format.json { render :show, status: :ok, location: @deporte }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @deporte.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deportes/1 or /deportes/1.json
  def destroy
    @deporte.destroy

    respond_to do |format|
      format.html { redirect_to deportes_url, notice: "Deporte was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deporte
      @deporte = Deporte.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def deporte_params
      params.require(:deporte).permit(:encabezado, :cuepor, :link)
    end
end
