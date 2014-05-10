; API
api = 2

; Core
core = 7.x

; Drupal project.
; This will download the Drupal core version that the installation profile will
; be built on. This should be updated as newer versions of Drupal get released.
projects[drupal] = 7.28

projects[atp][type] = profile
projects[atp][download][type] = git
projects[atp][download][url] = git@githost:/data/git/drupal/atp/sites/atp/profile.git

