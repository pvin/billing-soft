class DenominationService
    
  def self.balance_denomination cash_received, bill_amount
      raise ArgumentError, "Insufficient cash received" if cash_received < bill_amount
    balance = cash_received - bill_amount
    denominations = [500, 100, 50, 20, 10, 5, 2, 1]
    result = {}
    denominations.each do |note|
      count, balance = balance.divmod(note)
      result[note] = count if count > 0
    end
    result
  end

end