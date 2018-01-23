require 'rails_helper'

RSpec.describe DashboardController, :type => :controller do
  login_user
  let(:profile){FactoryGirl.create(:profile)}

  context "GET new" do

    it "assigns a blank BeerLog to the view" do

    end

  end
end
