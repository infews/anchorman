module Anchorman
  class Repo < Struct.new(:git_repo)

    def remote
      git_repo.remote
    end

    def is_github?
      remote &&
          remote.name == "origin" &&
          remote.url &&
          remote.url.match(/github\.com/)
    end

    def commit_url(sha)
      return sha unless is_github?

      "[#{sha}](#{github_url_for 'commit', sha})"
    end

    private

    def github_url_for(*components)
      repo_string = remote.url.match(/github\.com[\/:](.*)\.git$/)[1]
      ["https://github.com", repo_string, *components].join('/')
    end
  end
end
