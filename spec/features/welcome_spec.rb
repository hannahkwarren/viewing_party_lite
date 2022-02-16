# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User registration form' do
  it 'creates a new user' do
    visit root_path

    click_on 'Register as a User'

    expect(current_path).to eq(register_path)
  end
end
