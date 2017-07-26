require 'rest_client'
require 'multi_json'
require 'date'
require 'cgi'

require_relative 'document_cloud/version'
require_relative 'document_cloud/document'
require_relative 'document_cloud/project'
require_relative 'document_cloud/search_results'
require_relative 'document_cloud/default'
require_relative 'document_cloud/configurable'
require_relative 'document_cloud/client'

module DocumentCloud
  class << self
    include DocumentCloud::Configurable
    
    # Delegate to a DocumentCloud::Client
    #
    # @return [DocumentCloud::Client]
    def client
      @client = DocumentCloud::Client.new(credentials) unless defined?(@client)
      @client
    end
    
    # Has a client been initialized on the DocumentCloud module?
    #
    # @return [Boolean]
    def client?
      !!@client
    end
    
    
    def respond_to?(method_name, include_private=false)
      client.respond_to?(method_name, include_private) || super
    end
    
    private

      def method_missing(method_name, *args, &block)
        return super unless client.respond_to?(method_name)
        client.send(method_name, *args, &block)
      end
    
  end
end
