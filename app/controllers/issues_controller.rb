# crear controlador IssuesController que herede de ApplicationController
require 'json'
class IssuesController < ApplicationController

  before_action :issue_params, only: %i[show]
  before_action :set_issue, only: %i[show]

  def index; end
  def show; end  

  private

  def set_issue
    @issue = Issue.find(params[:issue_id])
  end
  
  def issue_params
    params
  end  

end
