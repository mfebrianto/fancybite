require 'rails_helper'

RSpec.describe MenuCategory do

  it { should validate_presence_of :name }

end
