class ExampleJob < ApplicationJob
  queue_as :default

  def perform(customer_id)
    customer = Customer.find(customer_id)
    Rails.logger.info "Processing customer #{customer.email}"
  end
  
end
