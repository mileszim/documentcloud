module DocumentCloud
  class Document
    attr_reader :id, :title, :access, :pages, :description, :source, :mentions,
      :canonical_url, :language, :display_language, :created_at, :updated_at
    
    def initialize(attrs={})
      @id               = attrs[:id]
      @title            = attrs[:title]
      @access           = attrs[:access]
      @pages            = attrs[:pages]
      @description      = attrs[:description]
      @source           = attrs[:source]
      @canonical_url    = attrs[:canonical_url]
      @language         = attrs[:language]
      @display_language = attrs[:display_language]
      @created_at       = DateTime.parse(attrs[:created_at])
      @updated_at       = DateTime.parse(attrs[:updated_at])
      @resources        = attrs[:resources]
      @mentions         = attrs[:mentions]
    end
    
    def pdf
      @resources[:pdf]
    end
    
    def print_annotations
      @resources[:print_annotations]
    end
    
    def related_article
      @resources[:related_article]
    end
    
    def text
      @resources[:text]
    end
    
    def thumbnail
      @resources[:thumbnail]
    end
    
    def image(page, size=1)
      @resources[:page][:image].gsub(/\{page\}/, page.to_s).gsub(/\{size\}/,size.to_s)
    end
    
    def entities
      @entities ||= DocumentCloud.entities(@id)
      @entities
    end

    # Fetch oembed object for this document
    #
    # @param options [Hash] Options Hash with oEmbed's parameters
    # @returns [DocumentCloud::OEmbed] object wrapper to oEmbed's json response
    def oembed(options)
      @oembed = DocumentCloud.oembed(@canonical_url, options)
    end
    
  end
end