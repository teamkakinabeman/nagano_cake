class Admin::GenresController < ApplicationController

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admin_genres_path
    else
      @genres = Genre.all
      render 'index'
    end
  end

  def edit
    @genre = Genre.find(genre_params)
  end

  def update
    if @genre.update(genre_params)
      redirect_to edit_admin_genre_path
    else
      render 'edit'
    end
  end

  private

    def genre_params
      params.require(:genre).permit(:name)
    end

end
