class CreateBuys < ActiveRecord::Migration[5.2]
  def change
    create_table :buys do |t|
      t.references :reserve, foreign_key: true

      t.timestamps
    end
  end
end
