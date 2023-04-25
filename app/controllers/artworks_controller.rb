class ArtworksController < ApplicationController
  def index
    @artworks = Artwork.all
  end

  def show
  end

  def new
  end

  def create
    artwork = Artwork.new(artwork_params)

    if artwork.save
      flash[:notice] = 'saved!'
    else
      flash.now[:alert] = 'failed to save'
    end
    redirect_to artworks_path
  end

  private 

  def artwork_params
    params.require(:artwork).permit(:title, :media)
  end
end
