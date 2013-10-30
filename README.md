# Anchorman
[![Build Status](https://travis-ci.org/infews/anchorman.png)](https://travis-ci.org/infews/anchorman)

_When you need trusted news, you turn to an anchorman._

Simply put, Anchorman scans your commit log and builds release notes for your project.

These notes are built in [Markdown][md] and live in a `release_notes` directory off of your project root. The expected usage is to have one file per release, named appropriately,  in this directory. When viewed locally they will be readable. When viewed on Github they will be rendered as nice HTML.

There is also an option to generate HTML versions of these files using [Github Flavored Markdown][gfm] for posting/hosting elsewhere.

If the repo is cloned from Github commit SHAs will be linked to Github's commits page.

If a commit message includes syntax for manipulating a story at [Pivotal Tracker's][pt] via a post-commit hook, the story id will be linked to Tracker.

## Installation

Add this line to your application's Gemfile:

    gem 'anchorman'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install anchorman

## Usage

Anchorman is fairly simple-minded. It generates files with a little bit of formatting, but not much.  The resulting files are meant as good starting points for more human-readable release notes.

    $ anchorman notes

Generates a `release_notes/release_notes.md` off of the root of your project.  Has a simple header and will have a bullet list of commit information from your entire repo.

    $ anchorman notes --from=<ref> --to=<ref>

Builds notes only for commits between two git refs. If not supplied, `to` defaults to `HEAD`.  Can be combined with other options.

    $ anchorman notes --name=<filename>

Writes out notes to `release_notes/<filename>.md`.  Can be combined with other options.

    $ anchorman html

Builds `release_notes/html` with html versions of all Markdown files in `release_notes`

Samples can be found in this repository.     

## Release Notes

[Notes live in the repo](https://github.com/infews/anchorman/blob/master/release_notes/release_notes.md). Generated with Anchorman and then made readable and useful to humans.


## Contributing

1. Checkout the [backlog at Pivotal Tracker][backlog]
1. Fork it
1. Create your feature branch (`git checkout -b my-new-feature`)
1. Commit your changes (`git commit -am 'Add some feature'`)
1. Push to the branch (`git push origin my-new-feature`)
1. Create new Pull Request


[pt]: http://www.pivotaltracker.com
[md]: http://daringfireball.net/projects/markdown/
[gfm]: https://help.github.com/articles/github-flavored-markdown
[backlog]: https://www.pivotaltracker.com/projects/776269
