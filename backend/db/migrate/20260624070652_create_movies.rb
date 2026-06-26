class CreateMovies < ActiveRecord::Migration[8.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :category
      t.string :image
      t.float :rating
      t.integer :year
      t.text :synopsis
      t.string :trailer_id
      t.boolean :is_new
      t.boolean :is_popular

      t.timestamps
    end
  end
end
