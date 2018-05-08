class SettingsController < ApplicationController

  def index
    @setting = Setting.first_or_create(metaTitle: '')
    @setting.socialAddresses.build
  end


  def create
    @setting = Setting.new(setting_params)

    if @setting.save
      redirect_back(fallback_location: root_path)
    end
  end

  def update
    @setting = Setting.first

    if @setting.update(setting_params)
      # Reload the page after successful update
      redirect_back(fallback_location: root_path)
    end
  end

  private
    def setting_params
      params.require(:setting).permit(:metaTitle, :metaAuthor, :metaDescription, :metaKeywords, socialAddresses_attributes: [:id, :name, :url])
    end


end