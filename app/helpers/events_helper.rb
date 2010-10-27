module EventsHelper
  def q (text)
    '"' + text.to_s + '"'
  end
end
