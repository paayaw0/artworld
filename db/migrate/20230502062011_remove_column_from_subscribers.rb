class RemoveColumnFromSubscribers < ActiveRecord::Migration[7.0]
  def change
    remove_column :subscribers, :count_jump, :integer
  end
end
