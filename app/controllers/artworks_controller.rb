class ArtworksController < ApplicationController
  def index
    @artworks = Artwork.all
  end

  def show
    @artwork = Artwork.find(params[:id])
  end

  def new
    @artwork = Artwork.new
  end

  def create
    @artwork = Artwork.new(artwork_params)

    if @artwork.save
      flash[:notice] = "Artwork Save Correctly."
      redirect_to artworks_path
    else
      flash[:notice] = "Artwork Not Saved."
      render :new
    end
  end

  protected
  def artwork_params
    params.require(:artwork).permit(:title, :number_in_series, :photo, :category_id, :date)
  end
end
