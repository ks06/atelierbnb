class CreateSpaces < ActiveRecord::Migration[6.0]
  def change
    create_table :spaces do |t|
      t.string :location
      t.string :type
      t.string :capacity
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
