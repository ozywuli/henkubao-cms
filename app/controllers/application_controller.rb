class ApplicationController < ActionController::Base
  before_action :getSettings, :getData

  protect_from_forgery with: :exception
  include SessionsHelper
  include ApplicationHelper

  protected

    def getData
      @menu = JSON.parse(File.read(Rails.root + 'app/data/menu.json'))
      @patreonObj = selected_object(@menu['outbound'], 'name', 'patreon')
    end

    def getSettings
      @setting = Setting.first
    end
end
