require 'rails_helper'

describe RegisteredCustomer do

  it { should validate_presence_of :password }

end