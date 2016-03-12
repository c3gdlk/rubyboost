class ActivityDecorator < Draper::Decorator
  delegate_all
  
  def partial_name
    object.trackable_type.underscore
  end
end
