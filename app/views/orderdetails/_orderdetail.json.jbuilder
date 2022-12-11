json.extract! orderdetail, :id, :date_submitted, :status, :subtotal, :shipping, :tax, :total, :order_id, :product_id, :created_at, :updated_at
json.url orderdetail_url(orderdetail, format: :json)
