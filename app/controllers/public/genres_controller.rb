class Public::GenresController < ApplicationController
  def show
    @genre = Genre.find(params[:id])
    @items = @genre.items
    @genres = Genre.all
  end
end
