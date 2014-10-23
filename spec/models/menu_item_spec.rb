require 'rails_helper'

describe MenuItem do

  it { should validate_presence_of :name }
  it { should validate_presence_of :menu_category }

end
