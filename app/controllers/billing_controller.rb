class BillingController < ApplicationController
  
  def calculate_bill
  end

  def generate_bill
    permitted = billing_params
    @customer = UserCreationService.find_or_create_user(permitted[:email])
    unless @customer
      return error_response("Customer creation failed")
    end
    bill_no = BillingService.bill(permitted[:products], @customer)
    @bill_details = CustomerProduct.where(bill_no: bill_no)
  rescue ActiveRecord::RecordInvalid, ActiveRecord::RecordNotFound => e
    error_response(e.message)
  end
  
  private

  def billing_params
    params.permit(:email, :cash_paid, products: [:product_id, :quantity], denominations: {})
  end

  def error_response(message = "Something went wrong. Please try again.")
    redirect_back( fallback_location: root_path, alert: message)
  end
end
