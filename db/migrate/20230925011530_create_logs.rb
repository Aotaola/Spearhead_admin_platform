class CreateLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :logs do |t|
      t.references :admin, foreign_key: { on_delete: :nullify }
      t.references :article, foreign_key: { on_delete: :nullify }
      t.references :service, foreign_key: { on_delete: :nullify }
      t.string :action
      t.string :article_title
      t.string :admin_name
      t.string :service_title
      

      t.timestamps
    end
  end
end
