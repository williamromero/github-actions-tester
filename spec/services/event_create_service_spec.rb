require 'rails_helper'

RSpec.describe Webhook::CreateIssueService do

  describe "initialize service params" do

    context "when params are valid" do
      it "should use call method to create new event" do
        service = described_class.call(payload_params)
        issue   = service.issue
        expect(service.issue_id).to eq(issue.id)
      end
    end
  end

  private

  def payload_params
    {
      "action" => "opened",
      "issue" => {
        "id" => 1,
        "title" => "Test issue",
        "user" => {
          "login" => "jaya"
        }
      }
    }
  end

end
