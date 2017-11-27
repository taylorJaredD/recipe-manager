class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredient.create(ingredients_params.merge(user: current_user))
    redirect_to recipe_path(@recipe)
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = Ingredient.find(params[:id])
    if @ingredient.user != current.user
      flash[:alert] = "Only the author of this recipe can edit it."
      redirect_to recipe_path(@recipe)
    end
  end

  def update
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = Ingredient.find(params[:id])
    if @ingredient.user == current.user
      @ingredient.update(ingredient_params)
    else
      flash[:alert] = "Only the author of this recipe can edit it."
    end
    redirect_to recipe_path(@recipe)
  end

  def destroy

  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:amount, :measurement, :item)
  end

end
