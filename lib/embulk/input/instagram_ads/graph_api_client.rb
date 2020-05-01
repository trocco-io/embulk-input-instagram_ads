module Embulk
  module Input
    module InstagramAdsScope
      require 'koala'
      class GraphApiClient
        def initialize(args)
          @args = args
          Koala.config.api_version = "v6.0"
          @graph = Koala::Facebook::API.new(@args[:access_token])
          get_campaign_insights
        end

        def get_campaign_ids
          @graph.get_connection(@args[:account_id], "campaigns", fields: columns)
        end

        def get_ad_account_insights
          @graph.get_connection(@args[:account_id], "insights", fields: columns)
        end

        def get_campaign_insights
          ids = get_campaign_ids
          ids.map do |id|
            @graph.get_connection(id["id"], "insights", fields: columns)
          end
        end

        # TODO: adset idが必要
        def get_adset_insights
          @graph.get_connection(@args[:adset_id], "insights")
        end

        # TODO: advertisment id が必要
        def get_ad_insights
          @graph.get_connection(@arg[:account_id], "insights")
        end

        private
        def columns
          @args[:columns].map { |column| column["name"] }
        end
      end
    end
  end
end
