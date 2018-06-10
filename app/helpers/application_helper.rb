module ApplicationHelper
  # Define custom asset path
  def custom_asset_path(path)
    path = REV_MANIFEST[path] if defined?(REV_MANIFEST)
    return '/assets/#{path}'
  end

  # Returns the full title on a per-page basis.
  def full_title(page_title = '', hideExtraTitle)
    base_title = "Henkubao - Your premiere blog and resource for all things Asian food"
    if page_title.empty?
      base_title
    else
      if hideExtraTitle.empty?
        "#{page_title} | #{base_title}"
      else
        "#{page_title}"
      end
      
    end
  end


  def selected_object(array, key, id)
    return array.detect { |obj| obj[key].downcase == id }
  end

end

