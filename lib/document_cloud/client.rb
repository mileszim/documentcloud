require_relative 'configurable'
require_relative 'api/utils'
require_relative 'api/search'
require_relative 'api/upload'
require_relative 'api/document'
require_relative 'api/update'
require_relative 'api/destroy'
require_relative 'api/entities'
require_relative 'api/oembed'
require_relative 'api/projects'
require_relative 'api/create_project'
require_relative 'api/update_project'

module DocumentCloud
  class Client
    include DocumentCloud::API::Utils
    include DocumentCloud::API::Search
    include DocumentCloud::API::Upload
    include DocumentCloud::API::Document
    include DocumentCloud::API::Update
    include DocumentCloud::API::Destroy
    include DocumentCloud::API::Entities
    include DocumentCloud::API::OEmbed
    include DocumentCloud::API::Projects
    include DocumentCloud::API::CreateProject
    include DocumentCloud::API::UpdateProject
    include DocumentCloud::Configurable
    
    def initialize(options={})
      DocumentCloud::Configurable.keys.each do |key|
        instance_variable_set(:"@#{key}", options[key] || DocumentCloud.instance_variable_get(:"@#{key}"))
      end
    end
    
    # Perform HTTP GET request
    def get(path, params={})
      RestClient.get request_base+path, {params: params}
    end
    
    # Perform HTTP POST request
    def post(path, params={})
      RestClient.post request_base+path, params
    end
    
    # Perform HTTP PUT request
    def put(path, params={})
      RestClient.put request_base+path, params
    end
    
    # Perform HTTP DELETE request
    def delete(path)
      RestClient.delete request_base+path
    end
    
    private
    
      def request_base
        "#{DocumentCloud::Default.http_mode}://#{@email}:#{@password}@#{DocumentCloud::Default.endpoint}"
      end
    
  end
end