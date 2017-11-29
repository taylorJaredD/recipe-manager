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
    if @recipe.user != current_user
      flash[:alert] = "Only the author of this recipe can edit it."
      redirect_to recipe_path(@recipe)
    end
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create(recipe_params.merge(user: current_user))
    if @recipe.save
      flash[:notice] = "Recipe was successfully created."
      redirect_to @recipe
    else
      render :new
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.user == current_user
      @recipe.update(recipe_params)
    else
      flash[:alert] = "Only the author of this recipe can edit it."
    end
    # @recipe.update(recipe_params)
    redirect_to recipe_path(@recipe)
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    if @recipe.user == current_user
      @recipe.destroy
    else
      flash[:alert] = "Only the author of this recipe can delete it."
    end
    # @recipe.destroy
    redirect_to recipes_path
  end

  def add_favorite
    @recipe = Recipe.find(params[:id])
    @recipe.favorites.create(user: current_user)
    redirect_back(fallback_location: root_path)
  end

  def remove_favorite
    @recipe = Recipe.find(params[:id])
    @favorite = Favorite.find_by(recipe: @recipe, user: current_user)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :img_url, :description, :directions, :bake_time, :baking_method, :serving_size)
  end

end
