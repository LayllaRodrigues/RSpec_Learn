RSpec.describe "Array Matchers Examples" do
	array = [1, 2, 3, 4]

	it "Should match a sample array [1,2,3,4]"	do
		expect(array).to match_array([1, 2, 3, 4])
		expect(array).to match_array([4, 3, 2, 1])
	end

	it "Should NOT match a sample array" do
		expect(array).not_to match_array([1, 2, 3])
		expect(array).not_to match_array([1, 2, 3, 4, 5])
	end

	it "Should contain some predefined numbers" do
		expect(array).to include(1)
		expect(array).to include(1, 2, 3)
		expect(array).to include(1, 2, 3, 4)
	end
	
	it "Should NOT include some predefined numbers" do
		expect(array).not_to include(0)
		expect(array).not_to include(5)
		expect(array).not_to include(5, 6, 7, 8)
		expect(array).not_to include([1, 2, 3, 4])
	end

	it "Should end with some certain of number" do
		expect(array).to end_with(4)
		expect(array).to end_with(3, 4)    
	end

	it "Should NOT end with number predefined number (3)" do
		expect(array).not_to end_with(3)
	end

	it "Should start with some certain number" do
		expect(array).to start_with(1)
		expect(array).to start_with(1, 2)
	end	

	it "Should NOT start with predefined number (2)" do
		expect(array).not_to start_with(2)
	end

end
Footer
