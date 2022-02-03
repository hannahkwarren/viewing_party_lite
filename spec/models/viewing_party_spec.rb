require 'rails_helper'

RSpec.describe ViewingParty, type: :model do 

  it { should have_many(:invitees) }
  it { should have_many(:users).through(:invitees) }

end
