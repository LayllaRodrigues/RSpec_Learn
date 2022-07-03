RSpec.describe "Stubs Matchers" do
  describe "LoanChecker Example" do
    # Testa se um cliente pode fazer um empréstimo
    describe "#can_lend_to?" do
      it "returns true when the client has no debt" do
        client = Client.new
        allow(client).to receive(:has_debt?).and_return(false)

        loan_checker = LoanChecker.new
        loan_evaluation = loan_checker.can_lend_to?(client)
        expect(loan_evaluation).to be_truthy
      end
    end
  end
end
