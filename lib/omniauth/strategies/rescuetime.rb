# frozen_string_literal: true

require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class Rescuetime < OmniAuth::Strategies::OAuth2
      option :client_options, {
        site: 'https://www.rescuetime.com',
        authorize_url: '/oauth/authorize',
        token_url: '/oauth/token'
      }

      option :redirect_url

      def authorize_params
        super.tap do |params|
          params[:response_type] = 'code'
          params[:client_id] = client.id
          params[:redirect_uri] ||= callback_url
        end
      end

      def callback_url
        options.redirect_url || super
      end

      def build_access_token
        token_params = {
          code: request.params['code'],
          redirect_uri: callback_url,
          client_id: client.id,
          client_secret: client.secret,
          grant_type: 'authorization_code'
        }
        client.get_token(token_params)
      end
    end
  end
end
