class ReviewsController < ApplicationController
  before_action :set_restaurant, only: %i[ new create ]

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # POST /reviews or /reviews.json
  def create
    @review = Review.new(review_params)

    @review.restaurant = @restaurant
    @review.save
    redirect_to restaurant_path(@restaurant)
  end

  private
    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit(:rating, :content)
    end

    def set_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end
end
