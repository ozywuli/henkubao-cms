module ApplicationHelper
  def custom_asset_path(path)
    path = REV_MANIFEST[path] if defined?(REV_MANIFEST)
    return '/assets/#{path}'
  end
end
