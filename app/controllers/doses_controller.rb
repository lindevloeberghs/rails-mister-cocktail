class DosesController < ApplicationController

  before_action :set_cocktail, only: [:new, :create]

  def new
    @dose = Dose.new
  end

  def create
    @dose = @cocktail.doses.build(dose_params)
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy

    # option 1: behavior expected by rake
    redirect_to cocktails_path

    # option 2: if we want to redirect_to cocktail_path(@cocktail) instead,
    # then we need cocktail_id in the params, so either:
    # a) we need to change the routes so that doses#destroy is also nested within the cocktail route
    # b) or we put it in the params ourselves when we link to doses#destroy:
    #    cfr (*) in cocktails show.html.erb
    #    plus add :destroy in the before_action :set_cocktail array
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id, :image)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

end
