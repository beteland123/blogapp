require 'rails_helper'

RSpec.describe User, type: :request do
    describe "#index" do
    it "returns a successful response" do
        get '/'
        expect(response).to have_http_status(:success)
     end
     it "renders the correct template " do
        get '/'
        expect(response).to render_template(:index)
      end
      it "response body includes correct placeholder text " do
        get '/'
        expect(response.body).to include("welcome to all users and thier respective number of posts")
      end

    end 
    

end