# Class: windows::visualcplusplus2010
#
# This module downloads then installs Visual C++
#
# Parameters: none
#
# Actions:
#

class windows::visualcplusplus2010 {
  $vs2010_url  = 'http://go.microsoft.com/?linkid=9709949'
  $vs2010_file = 'vc_web.exe'

  windows_common::download{'Visual_Studio_2010_C_Plus_Plus':
    url  => $vs2010_url,
    file => $vs2010_file,
  }

  package { 'vc_web.exe':
    ensure          => installed,
    source          => "${::temp}\\${vs2010_file}",
    provider        => 'windows',
    install_options => ['/q','/NORESTART'],
    require         => Commands::Download['Visual_Studio_2010_C_Plus_Plus'],
  }

}
