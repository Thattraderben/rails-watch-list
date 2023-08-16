class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  def index
    @movies = Movie.all
  end

  def show
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movies_path, notice: 'Movie was successfully created.'
    else
      render 'new'
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :overview)
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end

end
