class AddIsWatchlistToMovies < ActiveRecord::Migration[8.1]
  def change
    add_column :movies, :is_watchlist, :boolean
  end
end
