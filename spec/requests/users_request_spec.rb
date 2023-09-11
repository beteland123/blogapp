require 'rails_helper'

RSpec.describe User, type: :request do
    describe "#index" do
    it "returns a successful response" do
        get '/'
        expect(response).to have_http_status(:success)
     end
     it "renders the users template" do
        get '/'
        expect(response).to render_template(:index)
      end
    end 
    

end