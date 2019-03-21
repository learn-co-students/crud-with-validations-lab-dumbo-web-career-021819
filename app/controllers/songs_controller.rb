class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.create(songs_params)
    if @song.valid?
      redirect_to @song
    else
      render :new
    end
  end

  def show
    @song = Song.find(params[:id])
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    @song.update(songs_params)
    if @song.valid?
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    Song.find(params[:id]).destroy
    redirect_to songs_url
  end


  private

  def songs_params
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end
end
