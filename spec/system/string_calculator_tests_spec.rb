require 'rails_helper'

RSpec.describe "StringCalculatorTests", type: :system do
  before do
    driven_by(:rack_test)
  end

  it "it convert string to number" do
    visit '/'
    fill_in 'number_string', with: " '','1', '2' "

    click_on 'Convert'
    expect(page).to have_content('0,1,2')
    fill_in 'number_string', with: " '','1', '1,2' "
    click_on 'Convert'
    expect(page).to have_content('0,1,3')

    fill_in 'number_string', with: "1\n2,3"
    click_on 'Convert'
    expect(page).to have_content('6')

    fill_in 'number_string', with: "1,\n"
    click_on 'Convert'
    expect(page).to have_content('Invalid Input')

    fill_in 'number_string', with: "//;\n1;2"
    click_on 'Convert'
    expect(page).to have_content('3')

    
    fill_in 'number_string', with: " '','1', '-2' ,'-3'"
    click_on 'Convert'
    expect(page).to have_content('0, 1, Negative number not allowed -2, Negative Number not allowed -3')

  end
end
