class Contact < ApplicationRecord
  belongs_to :user
  
  has_many :contact_groups
  has_many :groups, through: :contact_groups

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates_format_of :email, with: /\A(\w|[.])+[@]\w+[.][a-z]{2,}\z/i, message: "is wrong"

  def full_name
    "#{first_name} #{last_name}"
  end

  def friendly_updated_at
    updated_at.strftime("%m/%d/%Y")
  end
end
