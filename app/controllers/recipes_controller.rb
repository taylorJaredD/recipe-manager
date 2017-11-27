class RecipesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @recipes = Recipe.all
  end


  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
    # if @recipe.user != current.user
    #   flash[:alert] = "Only the author of this recipe can edit it."
    #   redirect_to recipe_path(@recipe)
    # end
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create(recipe_params.merge(user: current_user))
    redirect_to recipe_path(@recipe)
  end

  def update
    @recipe = Recipe.find(params[:id])
    # if @recipe.user == current.user
    #   @recipe.update(recipe_params)
    # else
    #   flash[:alert] = "Only the author of this recipe can edit it."
    # end
    @recipe.update(recipe_params)
    redirect_to recipe_path(@recipe)
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    # if @recipe.user == current.user
    #   @recipe.destroy
    # else
    #   flash[:alert] = "Only the author of this recipe can delete it."
    # end
    @recipe.destroy
    redirect_to recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :description, :directions, :bake_time, :baking_method, :serving_size)
  end

end
