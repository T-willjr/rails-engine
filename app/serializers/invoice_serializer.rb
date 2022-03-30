class InvoiceSerializer
  include JSONAPI::Serializer
  attributes :customer_id, :merchant_id, :status

  has_many :invoice_items
  has_many :transactions
  has_many :items, through: :invoice_items
  has_many :merchants, through: :items
  belongs_to :customer
end
