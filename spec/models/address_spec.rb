require 'rails_helper'

describe Address do

  it { should validate_presence_of :address }

end