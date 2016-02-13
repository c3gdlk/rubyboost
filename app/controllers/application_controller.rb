class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def self.my_before_filter(filter, options={})
    @filter, @options = filter, options
  end

  def self.process_before_filter(instance)
    return unless @filter.present?

    if @options[:if].present? && @options[:if].is_a?(Symbol)
      return unless instance.send(@options[:if])
    end

    instance.send(@filter)
  end
end
