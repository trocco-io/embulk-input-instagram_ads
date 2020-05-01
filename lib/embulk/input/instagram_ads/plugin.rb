module Embulk
  module Input
    module InstagramAdsScope
      class Plugin < InputPlugin
         ::Embulk::Plugin.register_input("instagram_ads", self)

        def self.transaction(config, &control)
          task = {
            :access_token => config.param("access_token", :string), # string, required
            :account_id => config.param("account_id", :string), # string, required
            # TODO: act_account_insights, campaign_insights, adset_insights, ad_insightsそれぞれに対応
            # camaign_ids,
            :report_type => config.param("report_type", :string, default: "camaign_ids"),
            :columns => config.param("columns", :array),
          }
          columns = task[:columns].map do |column|
            ::Embulk::Column.new(nil, column["name"], column["type"].to_sym)
          end
          resume(task, columns, 1, &control)
        end

        def self.resume(task, columns, count, &control)
          task_reports = yield(task, columns, count)

          next_config_diff = {}
          return next_config_diff
        end

        # TODO
        # def self.guess(config)
        #   sample_records = [
        #     {"example"=>"a", "column"=>1, "value"=>0.1},
        #     {"example"=>"a", "column"=>2, "value"=>0.2},
        #   ]
        #   columns = Guess::SchemaGuess.from_hash_records(sample_records)
        #   return {"columns" => columns}
        # end

        def init; end

        def run
          datas = GraphApiClient.new(task).get_campaign_ids
          datas.each do |row|
            page_builder.add(
              task[:columns].map { |c| row[c["name"].to_sym] }
            )
          end
          page_builder.finish

          task_report = {}
          return task_report
        end
      end
    end
  end
end
