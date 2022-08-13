require 'rails_helper'

RSpec.describe "Coffees", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/coffees/index"
      expect(response).to have_http_status(:success)
    end
  end

end
