class CreateCats < ActiveRecord::Migration[5.2]
  def change
    create_table :cats do |t|
      t.date :birth_date, null: false
      t.string :color, null: false
      t.string :name, null: false
      t.string :sex, null: false, limit: 1
      t.text :description, null: false
      t.index :color, name: :cats_color
      t.index :name, name: :cats_name
      t.timestamps
    end
  end
end
