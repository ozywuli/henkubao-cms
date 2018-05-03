class ApplicationController < ActionController::Base
  before_action :getSettings

  protected

  def getSettings
    @setting = Setting.first
  end
end
