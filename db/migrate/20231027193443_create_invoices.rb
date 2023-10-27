class CreateInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :invoices do |t|
      t.belongs_to :patient, null: false, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
