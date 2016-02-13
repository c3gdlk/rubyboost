class WelcomeController < ApplicationController

  def wrap_with_h1
    "<h1>#{yield}</h1>".html_safe
  end

  def index
    @content = wrap_with_h1 do
      %w(bruce clark peter).select do |name|
        name != 'clark'
      end.map do |name|
        name.humanize
      end.join(' ')
    end
  end
end
