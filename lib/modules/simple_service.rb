module SimpleService
  extend ActiveSupport::Concern

  included do
    def self.perform(*args)
      new.perform(*args)
    end
  end
end

module SimpleServiceResult
  extend ActiveSupport::Concern

  included do
    attr_accessor :success, :comment_for_reject

    def initialize(success)
      self.success= success
    end

    def success?
      success
    end
  end
end
