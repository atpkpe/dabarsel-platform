#Procedure after unpacking this package
+ Make sure that a symlink is created in the root called site pointing at the relevant build. Eg: ln -s builds/jenkins-atpstage_stage-71 site.
+ run ./tools/update.sh

#Drush
Make sure that a drush folder is residing inside of the 'tools' dir.

Currently versions =< 6.x are supported.

That is because composer dependency is introduced in 7.x.