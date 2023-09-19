class CreateLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :logs do |t|
      t.references :admin, null: false, foreign_key: true
      t.references :article, null: false, foreign_key: true
      t.string :action
      t.string :article_title
      t.string :admin_name
      

      t.timestamps
    end
  end
end
