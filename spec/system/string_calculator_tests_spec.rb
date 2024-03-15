require 'rails_helper'

RSpec.describe "StringCalculatorTests", type: :system do
  before do
    driven_by(:rack_test)
  end

  it "it convert string to number" do
    visit '/'
    fill_in 'Number_string', with: " '','1', '2' "

    click_on 'Convert'

    fill_in 'Number_string', with: " '','1', '1,2' "
    click_on 'Convert'
  end
end
