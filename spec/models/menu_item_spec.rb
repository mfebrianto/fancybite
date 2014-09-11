require 'rails_helper'

RSpec.describe MenuItem do

  it { should validate_presence_of :name }
  it { should validate_presence_of :menu_category }

end
