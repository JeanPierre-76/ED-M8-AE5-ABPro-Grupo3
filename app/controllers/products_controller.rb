class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  before_action :authenticate_user!#, only: [:show, :edit, :update, :destroy]

  # GET /products or /products.json
  def index
    if params[:search].present?
      @products = Product.buscar(params[:search])
    elsif params[:user_id].present?
      @products = User.find_by_id(params[:user_id]).products
    else
      @products = Product.all
    end
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
    @product.tickets.build
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: "El producto fue creado satisfactoriamente." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: "El producto fue actualizado satisfactoriamente." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: "El producto fue destruído satisfactoriamente." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :price, :category, :photo, :user_id, tickets_attributes: [:name, :id, :_destroy], brands_attributes: [:nombre, :id, :_destroy])
    end
end
