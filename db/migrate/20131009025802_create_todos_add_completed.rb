class CreateTodosAddCompleted < ActiveRecord::Migration
  def up
    add_column :todos, :completed, :boolean, default: false
  end

  def down
    remove_column :todos, :completed
  end
end
