class AdminController < ApplicationController
  # Tambahkan method ini di dalam class AdminController
  def stats
    render json: {
      total_movies: Movie.count,
      total_users: User.count,
      total_votes: 0
    }
  end
end