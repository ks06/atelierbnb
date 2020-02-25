class AddColumnTitleToSpacesTable < ActiveRecord::Migration[6.0]
  def change
    add_column :spaces, :title, :string
  end
end
