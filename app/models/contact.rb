class Contact < ApplicationRecord
  has_many :contact_groups
  has_many :groups, through: :contact_groups

end
