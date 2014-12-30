class CreateRecipients < ActiveRecord::Migration
  def change
    create_table :recipients do |t|
      t.string :name
      t.date :birthday

      t.timestamps
    end
  end
end
