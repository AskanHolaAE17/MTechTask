# frozen_string_literal: true

class AddAttachmentFileToImports < ActiveRecord::Migration[5.2]
  def self.up
    change_table :imports do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :imports, :file
  end
end
