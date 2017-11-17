class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
    	t.column :name, :string
    	t.column :cost, :integer
    	t.column :country, :string

    	t.timestamp
    end
  end
end
