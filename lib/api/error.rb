module Api::Error
  CODES = {
    unknown: 520,
    record_not_found: 404,
    user_not_authenticated: 401,
    user_not_authorized: 403,
    record_error: 456,
  }

  class Base < ::Exception
    def initialize(*args)
      if args.length == 0
        t_key = self.class.name.underscore.gsub(/\//, '.')
        super I18n.t(t_key)
      else
        super *args
      end
    end
  end

  module API
    module Base
      class Unknown < Api::Error::Base; end
      class CreateFailed < Api::Error::Base; end
      class UpdateFailed < Api::Error::Base; end
      class DeleteFailed < Api::Error::Base; end
    end
    module Login
      class AuthenticationFailed < Api::Error::Base; end
    end
    module User
      class Unauthorized < Api::Error::Base; end
    end
  end
end
