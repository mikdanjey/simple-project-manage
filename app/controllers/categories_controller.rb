class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  layout "main"

  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.all
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)
      if @category.save
        gflash :success => 'Category was successfully created.'
        redirect_to categories_url
      else
        gflash :now, :error => @category.errors.full_messages.to_sentence
        render :new 
      end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    if @category.update(category_params)
        gflash :success => 'Category was successfully updated.'
        redirect_to categories_url
      else
        gflash :now, :error => @category.errors.full_messages.to_sentence
        render :edit 
      end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    gflash :success => 'Category was successfully destroyed.' 
    redirect_to categories_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      if params[:id].present?
        begin
        @category = Category.find(params[:id])
        rescue => e
          gflash:now, :error => "Category not found"
          redirect_to categories_url
        end
      else
        redirect_to categories_url
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name)
    end
end
