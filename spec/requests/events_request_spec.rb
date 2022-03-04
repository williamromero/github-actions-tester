require 'rails_helper'

RSpec.describe 'Event requests', type: :request do
  describe 'Running event requests' do

    context 'GET /issues/12/events' do
      let!(:issue)   { create(:issue, title: 'testing') }
      let!(:events)  { create_list(:event, 5, issue_id: issue.id) }

      before(:each) { get "/issues/#{issue.id}/events", params: { issue_id: issue.id } }
      
      let!(:data) { JSON.parse(response.body) }
      
      describe 'when issue events are required' do
        it "should return 5 records on json response" do
          result = request_information(issue)
          expect(events.length).to eq(5)
          expect(events.length).to eq(result.length)
          expect(data['result'].length).to eq(events.length)
        end

        it 'should return a 200 status' do
          expect(response.status).to eq(200)
        end
      end        
    end

    context 'POST /events' do
      before(:each) { post '/events', params: payload_params, as: :json }
      let!(:data) { JSON.parse(response.body) }

      describe 'when issue is created' do
        it 'should return the issue new record' do
          expect(data["action"]).to eq(payload_params[:action])
        end
      end
    end

    context 'POST /events' do
      before(:each) { post '/events', params: '{ "action": "opened" }', as: :json }
      let!(:data) { JSON.parse(response.body) }

      describe 'when events params is empty' do
        it 'should return an error' do
          expect(data["error"]).to eq("No issue_id provided")
        end
      end
    end    

  end

  private

  def request_information(issue) = issue.events

  def payload_params
    {
      "action": "opened",
      "issue": {
        "id": 1,
        "title": "Test issue",
        "user": {
          "login": "jaya"
        }
      }
    }
  end

  def parsed_params = JSON.parse(issue_params)

end
