class CreateGifts < ActiveRecord::Migration
  def change
    create_table :gifts do |t|
      t.string :description

      t.timestamps
    end
  end
end
