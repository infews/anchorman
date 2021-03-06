module Anchorman
  NOTES_HEADER = "# Release Notes\n\n## Summary\n\n## Changes\n\n"
  NOTES_FOOTER = "\n\n------\n\n_Release Notes generated with _[Anchorman](http://github.com/infews/anchorman)_"

  class CLI < Thor

    include Thor::Actions

    desc "notes", "Generates a draft release notes document"
    method_options from: :string, to: :string, name: "release_notes"

    def notes
      git = open_repo

      commits = if options[:from]
                  git.log(nil).between options[:from], options[:to]
                else
                  git.log(nil)
                end

      return unless commits.size

      say "#{commits.size} commit(s) found - building notes", :green

      empty_directory 'release_notes'

      formatter = CommitFormatter.new
      notes = commits.collect { |c| formatter.format(c) }.join("\n\n")

      create_file "release_notes/#{options[:name]}.md" do
        NOTES_HEADER + notes + NOTES_FOOTER
      end
    end

    desc "html", "Converts release notes to HTML using Github-Flavored Markdown"
    def html
      notes = get_notes

      return unless notes.length

      say "#{notes.length} note(s) found, generating HTML..."

      empty_directory File.join('release_notes', 'html')

      url = Git.open('.').remote.url

      notes.each do |n|
        converter = HtmlConverter.new(path: n, converter: Octokit, repo: GitHubRepo.new(url))
        create_file(File.join 'release_notes', 'html', converter.filename) do
          converter.html
        end
      end
    end

    no_tasks do

      def open_repo
        git = Git.open('.')
        git.log.size # this will raise if no repo or no commits
        git
      rescue ArgumentError
        say 'No git repo found', :red
      rescue Git::GitExecuteError
        say 'No git log found', :red
      end

      def get_notes
        notes = Dir.glob File.join('release_notes', '*.md')
        if notes.length == 0
          say "No release_notes directory found", :red
          say "Run 'anchorman notes' to generate release notes", :yellow
        end
        notes
      end

    end
  end
end
