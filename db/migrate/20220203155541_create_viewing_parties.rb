class CreateViewingParties < ActiveRecord::Migration[5.2]
  def change
    create_table :viewing_parties do |t|
      t.integer :duration
      t.string :when
      t.string :time
      t.string :movie_title
      t.string :poster_path
      t.timestamps
    end
  end
end
