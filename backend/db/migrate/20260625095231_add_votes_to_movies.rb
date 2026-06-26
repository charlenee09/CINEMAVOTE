class AddVotesToMovies < ActiveRecord::Migration[7.1]
  def change
    add_column :movies, :votes, :integer, default: 0
  end
end