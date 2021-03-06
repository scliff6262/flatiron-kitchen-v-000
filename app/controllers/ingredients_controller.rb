class IngredientsController < ApplicationController

  def index
  end

  def new
    @ingredient = Ingredient.new
  end

  def create

    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.valid?
      @ingredient.save
      redirect_to @ingredient
    else
      render :new
    end

  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    @ingredient.assign_attributes(ingredient_params)
    if @ingredient.valid?
      @ingredient.save
      redirect_to @ingredient
    else
      render :edit
    end
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def destroy
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end

end
