Given /^A directory without a git repo$/ do
  # nothing to do here
end

Given /^A git repo with no commits$/ do
  clean_tmp_dir
  init_git_repo
end

Given /^A git repo with commits$/ do
  clean_tmp_dir
  init_git_repo
  config_git
  commit "This is a commit message"
end

Given /^A repo with plenty of refs$/ do
  clean_tmp_dir
  init_git_repo
  config_git
  commit "This is a commit message"
  tag "tagA"
  commit "This is another commit"
  tag "tagB"
  commit "This is yet another commit"
end

Given /^A repo with plenty of commits$/ do
  clean_tmp_dir
  init_git_repo
  config_git
    
  (1..31).each do |i|
      commit "This is commit ##{i}"
  end
end

Given /^A directory without a release_notes directory$/ do
  clean_tmp_dir
end

Given /^A directory with a release_notes directory$/ do
  clean_tmp_dir
  init_git_repo
  config_git
  set_git_remote
  copy_notes_fixtures
end

Then /^the file "([^"]*)" should contain the notes header$/ do |file|
  check_file_content(file, "# Release Notes\n\n## Summary\n\n## Changes\n\n", true)
end

Then /^the file "([^"]*)" should contain the notes footer$/ do |file|
  check_file_content(file, "[Anchorman](http://github.com/infews/anchorman)", true)
end
