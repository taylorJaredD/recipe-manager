class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all
  end

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = Ingredient.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredients.create(ingredient_params)
    redirect_to recipe_path(@recipe)
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = Ingredient.find(params[:id])
    # if @ingredient.user != current.user
    #   flash[:alert] = "Only the author of this recipe can edit it."
    #   redirect_to recipe_path(@recipe)
    # end
    redirect_to recipe_path(@recipe)
  end

  def update
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = Ingredient.find(params[:id])
    # if @ingredient.user == current.user
    #   @ingredient.update(ingredient_params)
    # else
    #   flash[:alert] = "Only the author of this recipe can edit it."
    # end
    @ingredient.update(ingredient_params)
    redirect_to recipe_path(@recipe)
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = Ingredient.find(params[:id])
    @ingredient.destroy
    redirect_to recipe_path(@ingredient.recipe)
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:amount, :measurement, :item)
  end

end
