class AddColumnsToSnippets < ActiveRecord::Migration
  def change
    add_column :snippets, :code_type, :string
    add_column :snippets, :title, :string
    add_column :snippets, :work, :text
  end
end
