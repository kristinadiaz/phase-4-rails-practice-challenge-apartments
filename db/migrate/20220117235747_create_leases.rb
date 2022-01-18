class CreateLeases < ActiveRecord::Migration[6.1]
  def change
    create_table :leases do |t|
      t.integer :rent
      t.references :tenant
      t.references :apartment
      t.timestamps
    end
  end
end
