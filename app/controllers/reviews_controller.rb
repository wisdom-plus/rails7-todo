class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def create
    review = Review.new(review_params)
    review.save

  end

  private

  def review_params
    params.require(:review).per(:title,:content)
  end
end
