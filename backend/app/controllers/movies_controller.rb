class MoviesController < ApplicationController
  skip_before_action :verify_authenticity_token, raise: false

  # ==========================
  # GET /movies
  # ==========================
  def index
    if params[:search].present?
      @movies = Movie.where("title LIKE ?", "%#{params[:search]}%")
    elsif params[:category].present?
      @movies = Movie.where(category: params[:category])
    elsif params[:popular] == "true"
      @movies = Movie.where(is_popular: true)
    else
      @movies = Movie.all
    end

    render json: @movies
  end

  # ==========================
  # GET /movies/:id
  # ==========================
  def show
    @movie = Movie.find(params[:id])
    render json: @movie
  end

  # ==========================
  # POST /movies
  # ==========================
  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      render json: {
        message: "Film berhasil ditambahkan!",
        movie: @movie
      }, status: :created
    else
      render json: {
        errors: @movie.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  # ==========================
  # PATCH /movies/:id
  # ==========================
  def update
    @movie = Movie.find(params[:id])

    if @movie.update(movie_params)
      render json: {
        message: "Film berhasil diperbarui!",
        movie: @movie
      }
    else
      render json: {
        errors: @movie.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  # ==========================
  # DELETE /movies/:id
  # ==========================
  def destroy
    @movie = Movie.find(params[:id])

    @movie.destroy

    render json: {
      message: "Film berhasil dihapus!"
    }
  end

  # ==========================
  # PATCH /movies/:id/vote
  # ==========================
  def vote
    @movie = Movie.find(params[:id])

    if @movie.increment!(:votes)
      render json: {
        message: "Vote berhasil!",
        votes: @movie.votes,
        movie: @movie
      }
    else
      render json: {
        error: "Vote gagal"
      }, status: :unprocessable_entity
    end
  end

  # ==========================
  # PATCH /movies/:id/toggle_watchlist
  # ==========================
  def toggle_watchlist
    @movie = Movie.find(params[:id])

    new_status = !@movie.is_watchlist

    if @movie.update(is_watchlist: new_status)
      render json: {
        message: new_status ? "Ditambahkan ke Watchlist!" : "Dihapus dari Watchlist!",
        is_watchlist: @movie.is_watchlist
      }
    else
      render json: @movie.errors,
             status: :unprocessable_entity
    end
  end

  private

  def movie_params
    params.require(:movie).permit(
      :title,
      :category,
      :image,
      :year,
      :rating,
      :trailer_id,
      :synopsis,
      :is_new,
      :is_popular,
      :is_watchlist
    )
  end
end