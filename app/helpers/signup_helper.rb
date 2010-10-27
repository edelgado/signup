module SignupHelper
  def val(field)
    unless defined? field
      ''
    else
      field
    end
  end
end
