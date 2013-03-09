module Anchorman
  class Repo < Struct.new(:git_repo)

    def is_github?
      git_repo.remote &&
          git_repo.remote.name == "origin" &&
          git_repo.remote.url &&
          git_repo.remote.url.match(/github\.com/)
    end

    def commit_url(sha)
      return sha unless is_github?

      "#{git_repo.remote.url[0..-5]}/commits/#{sha}"
    end
  end
end