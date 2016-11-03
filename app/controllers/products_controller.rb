class ProductsController < ApplicationController
	before_action :set_product, only: [:show, :edit, :update, :destroy]
	def index
		@products = Product.all
	end

	def show
	end

	def new
		@colors = Color.all
		@sizes = Size.all
		@product = Product.new
	end

	def edit
	  @colors = Color.all
	  @sizes = Size.all
	end

	def create
	  @colors = Color.all
	  @sizes = Size.all
	  @product = Product.new(product_params)

	  respond_to do |format|
        if @product.save
          format.html { redirect_to @product, notice: 'Product criado com sucesso' }
        else
          format.html { render :new }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end
	end

	def update
	  @colors = Color.all
	  @sizes = Size.all

	  if @product.update(product_params)
		redirect_to @article
	  else
		render 'edit'
	  end
	end


	def destroy
	  @product.destroy

	  redirect_to products_path
	end


	def stock
		@prod_stock = []
		@colors = Color.all
		@sizes = Size.all
		@products = Product.select(:name).distinct
		@products.each do |product|
		  @colors.each do |color|
		  	@sizes.each do |size|
		  	  @qtd = Product.where(name: product.name, color: color.id, size: size.id).count(:all)
		  	  if @qtd != 0
		  	  	@prod_stock << ("#{@qtd} peças de #{product.name}, na cor #{color.name}, tamanho  #{size.name}")
		  	  end
		  	end
		  end 
		end
	end

	private

	def set_product
      @product = Product.find(params[:id])
    end

	def product_params
		params.require(:product).permit(:name, :description, :color_id, :size_id)
	end
end
