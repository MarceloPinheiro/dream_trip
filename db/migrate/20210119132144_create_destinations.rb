class CreateDestinations < ActiveRecord::Migration[6.1]
  def change
    create_table :destinations do |t|
      t.string :place
      t.string :image

      t.timestamps
    end
  end
end
