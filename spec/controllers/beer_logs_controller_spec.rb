require 'rails_helper'

RSpec.describe BeerLogsController, type: :controller do

  let(:user){ FactoryBot.create(:user) }
  let(:beer){ FactoryBot.create(:beer) }
  let(:beer_log){ FactoryBot.create(:beer_log, user_id: user.id, beer_id: beer.id) }

  before(:each) do
    sign_in user
  end

  context "GET new" do
    it "when new" do
      get :new, xhr: true
      expect(response).to have_http_status(:ok)
    end
  end

  context "POST create" do
    it "when valid" do
      params = { beer_log: { id: 1, user_id: user.id, beer_id: beer.id, quantity: 10, date: Time.now } }
      post :create, params: params
      expect(response).to have_http_status(:created)
    end

    it "when not valid" do
      params = { beer_log: { user_id: user.id, beer_id: '' } }
      post :create, params: params
      expect(response).to have_http_status(:bad_request)
      expect(BeerLog.count).to eq(0)
    end
  end

  context "GET edit" do
    it "when edited" do
      get :edit, params: { id: beer_log.id }, xhr: true
      expect(response).to have_http_status(:ok)
    end
  end

  context "PATCH update" do
    it "when valid" do
      # beer_log.attributes
      # # beer_log.quantity = 1111
      # # puts beer_log.attributes
      # # params = { beer_log: { quantity: 111 } }
      # put :update, params: beer_log.attributes
      # expect(response).to have_http_status(:accepted)
    end

    # it "when not valid" do
    #   params = { beer_log: { user_id: user.id, beer_id: '' } }
    #   patch :create, params: params
    #   expect(response).to have_http_status(:bad_request)
    #   expect(BeerLog.count).to eq(0)
    # end
  end

























  # context "POST create" do
  #
  #   it "redirects to pending subscriptions page" do
  #     params = { subscription: { email: "e@example.tld", start_on: "2014-12-31" } }
  #     post :create, params
  #
  #     expect(response).to redirect_to(pending_subscriptions_path)
  #   end
  #
  #   it "calls Subscription.create_and_request_confirmation(params)" do
  #     email = "e@example.tld"
  #     start_on = "2015-02-28"
  #
  #     expect(Subscription).to receive(:create_and_request_confirmation)
  #                                 .with({ email: email, start_on: start_on })
  #
  #     post :create, { subscription: { email: email, start_on: start_on } }
  #   end
  #
  #   it "raises an error if missing params email" do
  #     params = { subscription: { start_on: "2015-09-28" } }
  #
  #     expect do
  #       post :create, params
  #     end.to raise_error ActiveRecord::RecordInvalid
  #   end
  #
  # end
  #
  # context "GET confirm" do
  #
  #   it "confirms the subscription" do
  #     subscription = create(:subscription,
  #                           email: "e@e.tld",
  #                           confirmation_token: Subscription.generate_confirmation_token
  #     )
  #     expect(subscription.confirmed?).to eq(false)
  #
  #     params = { confirmation_token: subscription.confirmation_token }
  #     get :confirm, params
  #
  #     expect(subscription.reload.confirmed?).to eq(true)
  #     expect(assigns(:subscription)).to eq(subscription)
  #   end
  #
  #   it "responds with 404 Not Found for unknown confirmation token" do
  #     params = { confirmation_token: "an-unknown-token" }
  #     expect do
  #       get :confirm, params
  #     end.to raise_error ActiveRecord::RecordNotFound
  #   end
  #
  # end

end
