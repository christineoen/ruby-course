class CreateUsers < ActiveRecord::Migration
  def change
    # TODO
    create_table :users do |t|
      t.string :username
      t.string :password
      t.boolean :admin
    end
  end
end
