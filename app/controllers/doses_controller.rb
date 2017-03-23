class DosesController < ApplicationController

  before_action :set_cocktail

  def new
    @dose = Dose.new
  end

  def create
    @dose = @cocktail.doses.build(dose_params)
    p "*************"
    p @dose.valid?
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    if @dose.destroy
      redirect_to cocktail_path(@cocktail)
    else
      # TODO
    end

  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id, :image)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

end
