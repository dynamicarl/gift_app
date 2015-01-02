class GiftsNeedValues < ActiveRecord::Migration
  def change
		add_column :gifts, :value, :decimal
  end
end
