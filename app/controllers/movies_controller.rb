class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
    @ratings = @movie.ratings
    @rating = Rating.new
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movie_path(@movie)
    else
      render 'new'
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to movie_path(@movie)
    else
      render 'edit'
    end
  end

  def destroy
    Movie.find(params[:id]).destroy
    redirect_to root_path
  end

  def overall_score(movie_id)
    @ratings.each do |score, movie|
      if movie == movie_id
        overall_score += score
      end
    end
    overall_score
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :description, category_ids: [])
  end
end
