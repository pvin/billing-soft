class InvoiceMailer < ApplicationMailer

  def send_invoice customer_id, bill_no
    @customer = Customer.find(customer_id)
    @bill_details = CustomerProduct.where(bill_no: bill_no)
    mail(to: @customer.email, from: 'admin@shop.com',subject: "Invoice no #{bill_no}")
  end

end
