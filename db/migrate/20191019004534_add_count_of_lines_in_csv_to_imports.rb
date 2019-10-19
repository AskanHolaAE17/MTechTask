class AddCountOfLinesInCsvToImports < ActiveRecord::Migration[5.2]
  
  def up
    change_table :imports do |t|
      add_column :imports, :count_of_lines_in_csv, :integer
    end
  end

  def down
    change_table :imports do |t|
      remove_column :imports, :count_of_lines_in_csv
    end
  end
    
end