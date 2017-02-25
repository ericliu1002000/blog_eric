class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :content
      t.references :article, foreign_key: true
      t.boolean :is_delete, default: false
      t.integer :floor_number

      t.timestamps
    end
  end
end
