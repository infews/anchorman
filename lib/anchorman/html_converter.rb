module Anchorman
  class HtmlConverter
    def initialize(options)
      @path = options[:path]
      @converter = options[:converter]
      @repo = options[:repo]
    end

    def filename
      "#{File.basename(@path)[0..-4]}.html"
    end

    def html
      @converter.markdown(File.read(@path),
                          mode: 'gfm',
                          context: @repo.gfm_context)
    end
  end
end