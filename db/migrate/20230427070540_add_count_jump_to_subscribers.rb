class AddCountJumpToSubscribers < ActiveRecord::Migration[7.0]
  def change
    add_column :subscribers, :count_jump, :integer, default: 0
  end
end
