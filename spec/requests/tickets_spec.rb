require 'rails_helper'

RSpec.describe "Tickets", type: :request do
  let(:ticket) { create(:ticket) }
  let(:attributes) { { sequence_number: 98765 } }

  describe "#index" do
    it "returns http success /index" do
      get tickets_url
      expect(response).to have_http_status(:success)
    end
  end

  describe "#show" do
    it "returns http success /index" do
      get ticket_url(ticket)
      expect(response).to have_http_status(:success)
    end
  end

  describe "#edit" do
    it "renders a successful response" do
      get edit_ticket_path(ticket.id)
      expect(response).to be_successful
    end
  end

  describe "#update" do
    it { expect { patch ticket_path(ticket.id), params: { ticket: attributes } }.to change { Ticket.count }.by(1) }
    it "redirects to the tickets" do
      patch ticket_path(ticket.id), params: { ticket: attributes }
      expect(response).to redirect_to(tickets_url)
    end
  end

  describe "#destroy" do
    it { expect { delete ticket_path(ticket) }.to change { Ticket.count }.by(0) }

    it "redirects to the tickets" do
      delete ticket_path(ticket)
      expect(response).to redirect_to(tickets_url)
    end
  end
end
