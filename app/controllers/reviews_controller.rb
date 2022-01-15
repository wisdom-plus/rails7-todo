class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
    @review=Review.new
  end

  def create
    review = Review.new(review_params)
    review.save
    @reviews = Review.all
    render turbo_stream: turbo_stream.replace('reviews', partial: 'append')
  end

  def destroy
    review = Review.find_by(params[:id])
    review.destory
    @reviews = Review.all
    render turbo_stream: turbo_stream.replace('reviews', partial: 'append')
  end

  private

  def review_params
    params.require(:review).permit(:title,:content)
  end
end
