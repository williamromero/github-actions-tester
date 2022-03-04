require 'json'
require './app/services/hook/create_issue_service'

class EventsController < ApplicationController

  def index
    return render json: { error: "No issue found" }, status: 404 unless params[:issue_id].present?
    result = request_information params[:issue_id]
    render json: { result: result.events, status: 200 }
  end

  def create
    return render json: { error: "No issue_id provided" }, status: 400 if issue_param.nil?
    response = Hook::CreateIssueService.call(parsed_params)
    render json: response.to_json
  end

  private

  def issue_param = parsed_params["issue"]
  def parsed_params = JSON.parse(request.body.read)
  def request_information(issue_id) = Issue.find_by_id(issue_id)
    
  end
