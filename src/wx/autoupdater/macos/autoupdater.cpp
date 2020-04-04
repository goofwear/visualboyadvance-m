#include "../autoupdater.h"
#include "../../../common/version_cpp.h"
#include "../../strutils.h"
#include "sparkle-wrapper.h"

SparkleWrapper autoupdater;

void initAutoupdater()
{
    // even if we are a nightly, only check latest stable version
    wxString version = str_split(vbam_version, '-')[0];
    //autoupdater.addAppcastURL("http://data.vba-m.com/appcast.xml");
    autoupdater.addAppcastURL("https://raw.githubusercontent.com/visualboyadvance-m/visualboyadvance-m/master/data/appcast.xml");
}


void checkUpdatesUi()
{
    autoupdater.checkForUpdatesUi();
}


void shutdownAutoupdater()
{
}
