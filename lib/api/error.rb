module Api::Error
  CODES = {
    unknown: 520,
    record_not_found: 404,
    user_not_authenticated: 401,
    user_not_authorized: 403,
    join_campaign_no_oauth_account: 452,
    join_campaign_many_oauth_accounts: 453,
    join_campaign_not_enough_followers: 454,
    profile_not_completed: 455,
    record_error: 456,
    user_deleted: 457,
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
    module Common
      class Unknown < Api::Error::Base; end
    end
    module Login
      class AuthenticationFailed < Api::Error::Base; end
    end
    module User
      class Unauthorized < Api::Error::Base; end
      class JoinCampaignNoOauthAccount < Api::Error::Base; end
      class JoinCampaignManyOauthAcounts < Api::Error::Base; end
      class JoinCampaignNotEnoughFollowers < Api::Error::Base; end
      class ProfileNotCompleted < Api::Error::Base; end
      class Deleted < Api::Error::Base; end
    end
    module Post
      class CreateFailed < Api::Error::Base; end
      class UpdateFailed < Api::Error::Base; end
    end
  end
end
