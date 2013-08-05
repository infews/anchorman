module Anchorman
  class GitHubRepo

    attr_reader :username
    attr_reader :name

    def initialize(url)
      md = url.match(/github\.com\/(.*)\/(.*)\.git/)
      @username = md[1] || ''
      @name = md[2] || ''
    end

    def gfm_context
      "#{username}/#{name}"
    end
  end
end