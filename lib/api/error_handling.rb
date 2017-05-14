module Api::ErrorHandling
  def define_handle_exception_methods
    Rack::Utils::SYMBOL_TO_STATUS_CODE.keys.each do |status|
      define_singleton_method("handle_as_#{status}") do |*args|
        rescue_from *args do |exception|
          @success = false
          @error = exception
          @status = status
          @error_code = args[1].drill(:error_code)
          @error = Exception.new('Something went wrong! Please try again later!') if @error_code == Narratrs::Error::CODES[:unknown]
          render 'api/v1/base/error'
        end
      end
    end
  end
end
