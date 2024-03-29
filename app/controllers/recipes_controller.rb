# encoding: utf-8

class RecipesController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @recipes = Recipe.page(params[:page]).per(3)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @recipes }
    end
  end

  def my_recipes
    @recipes = Recipe.my_recipes(current_user.id).page(params[:page]).per(3)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @recipes }
    end
  end

  def show
    @recipe = Recipe.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @recipe }
    end
  end

  def new
    @recipe = Recipe.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @recipe }
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])

    unless @recipe.user == current_user
      redirect_to recipes_path, alert: "Você não tem permissão para alterar-lo."
    end
  end

  def create
    @recipe = Recipe.new(params[:recipe])
    @recipe.user_id = current_user.id

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to edit_recipe_path(@recipe), notice: 'Receita criada com sucesso.' }
        format.json { render json: @recipe, status: :created, location: @recipe }
      else
        format.html { render action: "new" }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @recipe = Recipe.find(params[:id])

    respond_to do |format|
      if @recipe.update_attributes(params[:recipe])
        format.html { redirect_to edit_recipe_path(@recipe), notice: 'Receita atualizada com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])

    if @recipe.user == current_user
      @recipe.destroy
      respond_to do |format|
        format.html { redirect_to recipes_url }
        format.json { head :no_content }
      end
    else
      redirect_to recipes_path, alert: "Você não tem permissão para excluí-lo."
    end
  end
end
