class RatingsController < ApplicationController
  def create
    @movie = Movie.find(params[:movie_id])
    @rating = @movie.ratings.build(rating_params)
    if @rating.save
      flash[:success] = 'Rating was created'
      redirect_back fallback_location: movie_path(@movie)
    else
      flash[:danger] = 'Rating not successful'
      redirect_to :back
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:score)
  end
end
