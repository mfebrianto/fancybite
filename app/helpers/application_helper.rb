module ApplicationHelper

  def new?(instance_variable)
    instance_variable.new_record?
  end

end
