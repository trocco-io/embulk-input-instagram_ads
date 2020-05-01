Dir[File.dirname(__FILE__) + '/instagram_ads/*.rb'].each {|file| require file }
module Embulk
  module Input
    module InstagramAdsScope
    end
  end
end
