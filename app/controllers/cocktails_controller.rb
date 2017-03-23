class CocktailsController < ApplicationController

  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  # if we add a destroy for cocktails:
  # because of the dependent destroy on the doses association,
  # when a cocktail is deleted also all of it doses will be deleted

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :picture, :picture_cache)
  end

end
