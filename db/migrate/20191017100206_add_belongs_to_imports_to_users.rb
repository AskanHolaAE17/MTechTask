class AddBelongsToImportsToUsers < ActiveRecord::Migration[5.2]

  def up
    change_table :users do |t|
      t.references :import, index: true
    end
  end

  def down
    change_table :users do |t|
      t.remove_references :import, index: true
    end
  end
  
end
