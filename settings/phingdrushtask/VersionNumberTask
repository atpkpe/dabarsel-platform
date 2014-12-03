<?php
require_once "phing/Task.php";

class VersionNumberTask extends Task
{
    private $versionprop;

    public function setVersionProp($versionprop)
    {
        $this->versionprop = $versionprop;
    }

    public function init()
    {
    }

    public function main()
    {
        // read the version text file in to a variable
        $version = file_get_contents("../htdocs/build.txt");
        $this->project->setProperty($this->versionprop, $version);
    }
}
