require 'rails_helper'

RSpec.describe User, type: :model do 

  describe "relationships" do 
    it { should have_many(:invitees) }
    it { should have_many(:viewing_parties).through(:invitees)}
  end
  
  describe "validations" do 
    it { should validate_uniqueness_of(:email) }
  end
  
end
