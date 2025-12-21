class BillingController < ApplicationController
  
  before_action :set_customer, only: [:view_bill, :view_bills]

  def calculate_bill
  end

  def generate_bill
    permitted = billing_params
    customer = UserCreationService.find_or_create_user(permitted[:email])
    unless customer
      return error_response("Customer creation failed")
    end
    bill_no = BillingService.bill(permitted[:products], customer, permitted[:cash_paid])
    InvoiceMailer.send_invoice(customer.id, bill_no).deliver_later(wait: 30.seconds)
    redirect_to view_customer_bill_path(customer.id, bill_no)
  rescue ActiveRecord::RecordInvalid, ActiveRecord::RecordNotFound => e
    error_response(e.message)
  end

  def view_bill
    @bill_details = CustomerProduct.where(bill_no: params[:bill_no])
    bill = @bill_details.first
    raise ActiveRecord::RecordNotFound, "Bill not found" unless bill
    @balance_to_pay = bill.cash_paid - bill.bill_total
    @balance_denomination = DenominationService.balance_denomination(bill.cash_paid, bill.bill_total)
  end

  def view_bills
    @bills = CustomerProduct.where(customer_id: @customer.id).order(:bill_no, :created_at).group_by(&:bill_no)
  end
  
  private

  def set_customer
    @customer = Customer.find(params[:customer_id])
  end

  def billing_params
    params.permit(:email, :cash_paid, products: [:product_id, :quantity], denominations: {})
  end

  def error_response(message = "Something went wrong. Please try again.")
    redirect_back( fallback_location: root_path, alert: message)
  end
end
