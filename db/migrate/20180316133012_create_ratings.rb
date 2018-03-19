class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.integer :score
      t.integer :movie_id
    end
  end
end
