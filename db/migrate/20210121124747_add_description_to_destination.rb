class AddDescriptionToDestination < ActiveRecord::Migration[6.1]
  def change
    add_column :destinations, :description, :text
  end
end
