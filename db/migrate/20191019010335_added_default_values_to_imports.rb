# frozen_string_literal: true

class AddedDefaultValuesToImports < ActiveRecord::Migration[5.2]
  def up
    change_table :imports do |_t|
      change_column :imports, :count_of_created_users,     :integer, default: 0
      change_column :imports, :count_of_not_created_users, :integer, default: 0
      change_column :imports, :count_of_lines_in_csv,      :integer, default: 0
    end
  end

  def down
    change_table :imports do |_t|
      change_column :imports, :count_of_created_users,     :integer, default: nil
      change_column :imports, :count_of_not_created_users, :integer, default: nil
      change_column :imports, :count_of_lines_in_csv,      :integer, default: nil
    end
  end
end
