class RemoveColumnUsername < ActiveRecord::Migration
  def change
   remove_column :Comments, :username
  end
end
