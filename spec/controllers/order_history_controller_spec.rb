require 'rails_helper'

describe OrderHistoryController do

  describe 'INDEX' do
    it 'render index template' do
      get :index
      expect(response).to render_template("index")
    end
  end

end