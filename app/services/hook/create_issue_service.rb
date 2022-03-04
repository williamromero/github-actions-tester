module Hook
  class CreateIssueService < ApplicationService
    
    def initialize(params)
      @params = params
    end

    def call
      create_transaction
    end

    def create_transaction
      ActiveRecord::Base.transaction do
        @issue = Issue.find_or_create_by(number: issue_number, title: issue_title)
        @issue.events.create(action: issue_action, payload: issue, user: issue_username)
      end
    end

    private
    
    def issue           = @params["issue"]
    def issue_number    = @params["issue"]["id"].to_i
    def issue_title     = @params["issue"]["title"]
    def issue_username  = @params["issue"]["user"]["login"] 
    def issue_action    = @params["action"]

  end
end
