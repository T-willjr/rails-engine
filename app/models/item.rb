class Item < ApplicationRecord
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  belongs_to :merchant

  def self.search(search_params)
    where("name ILIKE ?", "%#{search_params}%")
  end
end 