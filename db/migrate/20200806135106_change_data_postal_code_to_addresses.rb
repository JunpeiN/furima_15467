class ChangeDataPostalCodeToAddresses < ActiveRecord::Migration[6.0]
  def change
    change_column :addresses, :postal_code, :string
  end
end