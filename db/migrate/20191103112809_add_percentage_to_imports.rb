class AddPercentageToImports < ActiveRecord::Migration[5.2]
  def change
    add_column :imports, :percentage, :integer, default: 0
  end
end
