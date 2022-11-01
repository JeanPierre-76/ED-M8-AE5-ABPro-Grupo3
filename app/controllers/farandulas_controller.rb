class FarandulasController < ApplicationController
  before_action :set_farandula, only: %i[ show edit update destroy ]

  # GET /farandulas or /farandulas.json
  def index
    @farandulas = Farandula.all
  end

  # GET /farandulas/1 or /farandulas/1.json
  def show
  end

  # GET /farandulas/new
  def new
    @farandula = Farandula.new
  end

  # GET /farandulas/1/edit
  def edit
  end

  # POST /farandulas or /farandulas.json
  def create
    @farandula = Farandula.new(farandula_params)

    respond_to do |format|
      if @farandula.save
        format.html { redirect_to farandula_url(@farandula), notice: "Farandula was successfully created." }
        format.json { render :show, status: :created, location: @farandula }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @farandula.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /farandulas/1 or /farandulas/1.json
  def update
    respond_to do |format|
      if @farandula.update(farandula_params)
        format.html { redirect_to farandula_url(@farandula), notice: "Farandula was successfully updated." }
        format.json { render :show, status: :ok, location: @farandula }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @farandula.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /farandulas/1 or /farandulas/1.json
  def destroy
    @farandula.destroy

    respond_to do |format|
      format.html { redirect_to farandulas_url, notice: "Farandula was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_farandula
      @farandula = Farandula.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def farandula_params
      params.require(:farandula).permit(:encabezado, :cuepor, :link)
    end
end
