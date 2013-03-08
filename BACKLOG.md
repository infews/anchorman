1. As a developer I want to see a Markdown document of all of the commits in my repository, highlighting the contributor SHA, and commit message
1. As a developer I want the Markdown to follow Github-Flavored-Markdown conventions in order to have useful links when Github displays the files
1. As a developer I want to restrict the release notes document from HEAD back to the last marked release because older docs should not change
1. As a developer I want the release notes documents to follow a common naming convention based on the release name/number
1. As a developer I want to specify a directory where the release notes should live so that the files don't pollute the root directory of the project
1. As a developer I want to have the option not to overwrite a generated file
1. As a developer I want to be reminded to which files were added and where they were added so that I don't forget to check them into git

Generate makes a directory of docs
a doc has:

* Name
* Date
* Changes (collection of commits)
  * Bug Fixes
  * Improvements
  * Feature


A Change has

* commit SHA
* author
* message
* Tracker Story
* Github Issue