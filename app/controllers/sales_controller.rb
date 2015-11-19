class SalesController < ApplicationController
  def index
    vendor_id = params[:vendor_id]
    @product_names = []
    @total = 0
    @sales = Sale.where(vendor_id: vendor_id)
    @sales.each do |sale|
      @total += sale.amount
      product = sale.vendor.products.find(sale.product_id).name
      @product_names.push(product)
    end

  end
end
