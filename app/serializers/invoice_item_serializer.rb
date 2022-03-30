class InvoiceItemSerializer
  include JSONAPI::Serializer
  attributes :id, :item_id, :invoice_id, :quantity, :unit_price

  belongs_to :invoice
  belongs_to :item
end
