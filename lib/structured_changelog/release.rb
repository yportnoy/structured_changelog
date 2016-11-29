class StructuredChangelog
  class Release
    attr_reader :contents

    def self.start_with?(line)
      line =~ pattern
    end

    def self.pattern
      /^## RELEASE (?<version>\S+)$/
    end

    def initialize(contents)
      @contents = contents.strip
    end

    def validate
      notifications = []

      notifications << "No version number" if version.nil?

      notifications
    end

    def version
      contents.match(self.class.pattern)[:version]
    end

    def <=>(release)
      version <=> release.version
    end
  end
end
