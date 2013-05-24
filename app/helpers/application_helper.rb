module ApplicationHelper

  # Create title for pages
  def full_title(page_title)
    base_title = "Assignment for TapIn" # Default title
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
end