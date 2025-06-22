class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: %i[show edit update destroy]

  # GET /products
  def index
    @products = current_user.products
  end

  # GET /products/1
  def show
  end

  # GET /products/new
  def new
    @product = current_user.products.build
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  def create
    @product = current_user.products.build(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: "Produto criado com sucesso." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: "Produto atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy!
    respond_to do |format|
      format.html { redirect_to products_path, notice: "Produto apagado com sucesso.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private

    # Busca o produto do usuário atual
    def set_product
      @product = current_user.products.find(params[:id])
    end

    # Permite apenas parâmetros confiáveis
    def product_params
      params.require(:product).permit(:nome, :quantidade, :valor, :image)
    end
end
