module DocumentCloud
  class Version
    MAJOR = 0 unless defined? DocumentCloud::Version::MAJOR
    MINOR = 4 unless defined? DocumentCloud::Version::MINOR
    PATCH = 0 unless defined? DocumentCloud::Version::PATCH
    PRE = nil unless defined? DocumentCloud::Version::PRE

    class << self

      # @return [String]
      def to_s
        [MAJOR, MINOR, PATCH, PRE].compact.join('.')
      end

    end

  end
end
