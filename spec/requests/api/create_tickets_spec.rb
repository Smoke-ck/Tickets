require 'rails_helper'

RSpec.describe 'Ticket', type: :request do
  let(:params) do
    File.read('spec/fixtures/ticket.json')
  end

  describe "#create" do
    context "with valid parameters" do
      it 'success' do
        expect do
          post api_tickets_path,
          params: params,
          headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
        end.to change { Ticket.count }.by(1)
        expect(response).to have_http_status(:success)
      end
    end
  end
end
