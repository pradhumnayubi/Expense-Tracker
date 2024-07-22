class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.references :employee, null: false, foreign_key: true
      t.text :content, null: false
      t.references :parent, foreign_key: { to_table: :comments }
      t.references :commentable, polymorphic: true, null: false

      t.timestamps
    end

    remove_column :expense_reports, :comments, :text
  end
end
