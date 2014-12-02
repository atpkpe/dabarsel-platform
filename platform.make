; API
api = 2

; Core
core = 7.x

; Drupal project.
; This will download the Drupal core version that the installation profile will
; be built on. This should be updated as newer versions of Drupal get released.
projects[drupal][version] = 7.32
projects[drupal][patch][] = "http://svnhosttest.adapt.dk/atp-platform.patch"
projects[drupal][patch][] = "http://svnhosttest.adapt.dk/atp-compression.patch"

projects[atp][type] = profile
projects[atp][download][type] = git
projects[atp][download][url] = git@githost:/data/git/drupal/atp/sites/atp/platform.git

