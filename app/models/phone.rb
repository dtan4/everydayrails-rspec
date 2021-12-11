class Phone < ApplicationRecord
  belongs_to :contact

  validates :phone, uniqueness: { scope: :contact_id }
end
