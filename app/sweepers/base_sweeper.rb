class BaseSweeper

  private

  def controller_name
    raise 'Not Implemented'
  end

  def expire_custom_action(action, user_id, options={})
    initialize_controller unless @controller.present?

    expire_options = {controller: controller_name, action: action, user_id: user_id, only_path: true }.merge(options)

    @controller.send(:expire_action, expire_options)
  end

  def initialize_controller
    @controller ||= ApplicationController.new

    if @controller.request.nil?
      @controller.request = ActionDispatch::TestRequest.new
    end
  end
end
