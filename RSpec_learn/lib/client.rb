class Client
  attr_reader :debt

  def initialize
    @debt = false
  end

  def has_debt?
    @debt
  end
end
