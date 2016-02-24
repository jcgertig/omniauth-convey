require "omniauth-oauth2"

module OmniAuth
  module Strategies
    class Convey < OmniAuth::Strategies::OAuth2
      DEFAULT_SCOPE = ""

      option :name, :convey

      option :client_options, {
        site: "http://localhost:3000",
        authorize_url: "/oauth/authorize",
        token_url: "/oauth/token"
      }

      option :access_token_options, {
        header_format: "Bearer %s",
        param_name: "access_token"
      }

      option :authorize_options, [:scope]

      uid{ raw_info["user"]["_id"] }

      info do
        {
          email: raw_info["user"]["email"],
          urls: { profile: "http://localhost:3000/api/v1/user/#{raw_info["user"]["_id"]}" }
        }
      end

      extra do
        {
          raw_info: raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get("/api/v1/me").parsed
      end

      def callback_url
        full_host + script_name + callback_path
      end

      def authorize_params
        super.tap do |params|
          options[:authorize_options].each do |k|
            params[k] = request.params[k.to_s] unless [nil, ""].include?(request.params[k.to_s])
          end
          params[:scope] = params[:scope] || DEFAULT_SCOPE
        end
      end
    end
  end
end
