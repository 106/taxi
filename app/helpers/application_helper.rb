module ApplicationHelper
  def e(*args, &block)
    escape_javascript *args, &block
  end
end
