require 'rails_helper'

RSpec.describe "Indices", type: :request do
  describe "GET /home" do
    it "returns http success" do
      get "/index/home"
      expect(response).to have_http_status(:success)
    end
  end

end
