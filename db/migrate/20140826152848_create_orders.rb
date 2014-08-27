class CreateOrders < ActiveRecord::Migration
  def change
    # TODO
    create_table :orders do |t|
      t.belongs_to :user
    end
  end
end
