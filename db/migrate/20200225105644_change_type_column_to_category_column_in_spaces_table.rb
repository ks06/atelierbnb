class ChangeTypeColumnToCategoryColumnInSpacesTable < ActiveRecord::Migration[6.0]
  def change
    rename_column :spaces, :type, :category
  end
end
