require "test_helper"

class CompanyTest < ActiveSupport::TestCase
	def setup
    @company = companies(:wolf_painting)
  end

	test 'valid company' do
		assert @company.valid?
  end

  test 'invalid with invalid email' do
  	@company.email = "test.com"
  	refute @company.valid?
    assert_not_nil @company.errors[:email]
  end

  test 'valid without email' do
  	@company.email = nil
  	assert @company.valid?
  end
end
