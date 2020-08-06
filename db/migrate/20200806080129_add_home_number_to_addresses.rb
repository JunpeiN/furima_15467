class AddHomeNumberToAddresses < ActiveRecord::Migration[6.0]
  def change
    add_column :addresses, :home_number, :string
  end
end
