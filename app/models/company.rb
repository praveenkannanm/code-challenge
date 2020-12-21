class Company < ApplicationRecord
  has_rich_text :description

  validates :email, format: { with: /\b[A-Z0-9._%a-z\-]+@+getmainstreet\.com\z/,
                  message: "must be a @getmainstreet.com account" }, :allow_blank => true

  before_save :set_city_and_state, if: :will_save_change_to_zip_code?

  def set_city_and_state
  	result = ZipCodes.identify(self.zip_code)
  	self.city = result[:city]
  	self.state = result[:state_name]
  end
end