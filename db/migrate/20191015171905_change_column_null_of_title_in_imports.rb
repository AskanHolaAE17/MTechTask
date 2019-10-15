class ChangeColumnNullOfTitleInImports < ActiveRecord::Migration[5.2]

  def self.up
    change_column_null :imports, :title, :string, false
  end

  def self.down
    change_column_null :imports, :title, :string, true
  end
  
end
