class CreateRegisters < ActiveRecord::Migration[5.2]
  def change
    create_table :registers do |t|
      t.belongs_to :user, foreign_key: true
      t.integer :kind
      t.datetime :date
      t.string :description

      t.timestamps
    end
  end
end
