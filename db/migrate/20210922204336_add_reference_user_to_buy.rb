class AddReferenceUserToBuy < ActiveRecord::Migration[5.2]
  def change
    add_reference :buys, :user, foreign_key: true
  end
end
