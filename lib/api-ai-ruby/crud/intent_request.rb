module ApiAiRuby
  class IntentRequest < ApiAiRuby::RequestQuery

    def initialize(client,  options = {})
      super client, options
      @headers['Content-Type'] = 'application/json; charset=UTF-8'
      @crud_base_uri = client.api_base_url + 'intents'
      @uri = @crud_base_uri
    end

    # @param name [String]
    # @return [ApiAiRuby::Intent]
    def retrieve(iid)
      raise ApiAiRuby::ClientError.new('Entity IID required') if !iid
      @request_method = :get
      @uri = @crud_base_uri + '/' + iid
      self.perform
    end

    # @return [Array<ApiAiRuby::Intent>]
    def list
      @request_method = :get
      @uri = @crud_base_uri
      @options = nil
      self.perform
    end

  end
end
