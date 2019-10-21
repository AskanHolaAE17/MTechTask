# frozen_string_literal: true

class AddDetailsToImports < ActiveRecord::Migration[5.2]
  def up
    add_column :imports, :started_at,                 :datetime
    add_column :imports, :completed_at,               :datetime
    add_column :imports, :import_status,              :string, default: 'created'
    add_column :imports, :count_of_created_users,     :integer
    add_column :imports, :count_of_not_created_users, :integer
  end

  def down
    remove_column :imports, :started_at
    remove_column :imports, :completed_at
    remove_column :imports, :import_status
    remove_column :imports, :count_of_created_users
    remove_column :imports, :count_of_not_created_users
  end
end
