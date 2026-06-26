class ReviewsController < ApplicationController
  skip_before_action :verify_authenticity_token, raise: false

  # GET /movies/:movie_id/reviews
  def index
    reviews = Review.where(movie_id: params[:movie_id]).includes(:user)

    render json: reviews.as_json(
      include: {
        user: {
          only: [:id, :username]
        }
      }
    )
  end

  # POST /movies/:movie_id/reviews
  def create
    @review = Review.new(review_params)

    if @review.save
      render json: {
        message: "Review berhasil diposting!",
        review: @review
      }, status: :created
    else
      render json: {
        error: @review.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(
      :user_id,
      :movie_id,
      :comment,
      :rating
    )
  end
end