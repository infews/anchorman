module Helpers

  def tmp_dir
    "tmp/aruba"
  end

  def clean_tmp_dir
    FileUtils.rm_rf tmp_dir
  end

  def cd_tmp_aruba
    FileUtils.mkdir_p tmp_dir
    Dir.chdir tmp_dir do
      yield
    end
  end

  def init_git_repo
    cd_tmp_aruba do
      system "git init ."
    end
  end

  def config_git
    system "git config user.name Ron Burgundy"
    system "git config user.email scotchyscotch@example.com"
  end

  def commit(message)
    system "touch foo.rb"
    system "git add ."
    system "git commit -am '#{message}'"
  end

end

World Helpers
