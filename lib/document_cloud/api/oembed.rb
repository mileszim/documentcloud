require 'cgi'

module DocumentCloud
  module API
    module OEmbed
      include DocumentCloud::API::Utils
      OEMBED_PATH = '/api/oembed.json'
      
      # Get oEmbed json object for a given document
      #
      # @see https://www.documentcloud.org/help/api#oembed
      # @param url [String] The url of the document to be shown in the embeded visor
      # @param options [Hash] Customizable set of options
      # @param options [Integer] :maxheight         The viewer's height (pixels)
      # @param options [Integer] :maxwidth          The viewer's width (pixels)
      # @param options [String]  :container         Specify the DOM container in which to embed the viewer, example: '#my-document-div'
      # @param options [Boolean] :notes             Enable the notes tab. default: true
      # @param options [Boolean] :text              Enable the text tab. default: true
      # @param options [Boolean] :zoom              Show the zoom slider. default: true
      # @param options [Boolean] :search            Show the search box. default: true
      # @param options [Boolean] :sidebar           Show the sidebar. default: true
      # @param options [Boolean] :pdf               Include a link to the original PDF. default: true
      # @param options [Boolean] :responsive        Make the viewer responsive. default: false
      # @param options [Integer] :responsive_offset Specify header height (pixels)
      # @param options [Integer] :default_note      Open the document to a specific note. An integer representing the note ID
      # @param options [Integer] :default_page      Open the document to a specific page
      # @returns [DocumentCloud::OEmbed] object wrapper to oEmbed's json response
      def oembed(url, options={})
        escaped_url = CGI.escape url
        build_object DocumentCloud::oEmbed, get(OEMBED_PATH, options.merge(:url => escaped_url))
      end
      
    end
  end
end