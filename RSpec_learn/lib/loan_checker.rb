class LoanChecker
  def can_lend_to?(client)
    !client.debt
  end
end
