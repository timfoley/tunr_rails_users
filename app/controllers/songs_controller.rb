class SongsController < ApplicationController
  # index
  def index
    @songs = Song.all
  end

  # new
  def new
    redirect_to root_path unless @current_user
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.new
  end

  # create
  def create
    redirect_to root_path unless @current_user
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.create(song_params)

    redirect_to @song
  end

  #show
  def show
    @song = Song.find(params[:id])
  end

  # edit
  def edit
    redirect_to root_path unless @current_user
    @song = Song.find(params[:id])
  end

  # update
  def update
    @song = Song.find(params[:id])
    @song.update(song_params)

    redirect_to @song
  end

  # destroy
  def destroy
    redirect_to root_path unless @current_user
    @song = Song.find(params[:id])
    @song.destroy

    redirect_to songs_path
  end

  private
  def song_params
    params.require(:song).permit(:title, :album, :preview_url, :artist_id)
  end
end
