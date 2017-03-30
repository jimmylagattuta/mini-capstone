class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :photo_one
      t.string :photo_two
      t.string :photo_three
      t.string :photo_four
      t.string :photo_five

      t.timestamps
    end
  end
end
