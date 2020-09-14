# frozen_string_literal: true

# Application helper module
module ApplicationHelper
  def full_title(page_title = '')
    base_title = '条件管理モニター'
    if page_title.empty?
      base_title
    else
      page_title + ' | ' + base_title
    end
  end
end
