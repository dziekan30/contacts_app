class ChagnePhoneNumberOnContacts < ActiveRecord::Migration[6.0]
  def change
    rename_column :contacts, :phone_nuber, :phone_number
  end
end
