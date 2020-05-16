module DocumentCloud
  class OEmbed
    attr_reader :type, :version, :provider_name, :provider_url,
      :cache_age, :height, :width, :html
    
    def initialize(attrs={})
      @type          = attrs[:type]
      @version       = attrs[:version]
      @provider_name = attrs[:provider_name]
      @provider_url  = attrs[:provider_url]
      @cache_age     = attrs[:cache_age]
      @height        = attrs[:height]
      @width         = attrs[:width]
      @html          = attrs[:html]
    end
        
  end
end