class RenameDocumentsToPosts < ActiveRecord::Migration[5.0]
  def change
    rename_table :documents, :posts
  end
end
