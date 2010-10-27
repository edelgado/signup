# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def setup_event(event)
    returning(event) do |e|
      e.items.build if e.items.empty?
    end
  end
end
