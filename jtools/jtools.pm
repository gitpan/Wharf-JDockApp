package Wharf::JDockApp::jtools;

use strict;
use Carp;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK $AUTOLOAD);

require Exporter;
require DynaLoader;
require AutoLoader;

@ISA     = qw(Exporter DynaLoader);
@EXPORT  = qw( BLUE CYAN GREEN INDIGO NUMBERS ORANGE PINK RED VIOLET YELLOW jprint jpprint );

$VERSION = '1.0'; # likely there won't be anymore updates to this stuff.

sub AUTOLOAD {
    my $constname;
    ($constname = $AUTOLOAD) =~ s/.*:://;
    croak "& not defined" if $constname eq 'constant';
    my $val = constant($constname, @_ ? $_[0] : 0);
    if ($! != 0) {
	if ($! =~ /Invalid/) {
	    $AutoLoader::AUTOLOAD = $AUTOLOAD;
	    goto &AutoLoader::AUTOLOAD;
	} else { croak "Your vendor has not defined jtools macro $constname"; }
    }
    no strict 'refs';
    *$AUTOLOAD = sub { $val };
    goto &$AUTOLOAD;
}

bootstrap Wharf::JDockApp::jtools $VERSION;

1;

__END__
# Below is the stub of documentation for your module. You better edit it!

=head1 NAME

jtools - Perl extension for JDockApp.  It's the tools, man.

=head1 SYNOPSIS

  use Wharf::JDockApp::jtools;

  Wharf::JDockApp::jtools::jpprint($x, $y, COLOR, "text");
  Wharf::JDockApp::jtools::jprint(COLOR, "text");

  Wharf::JDockApp::jtools::set_setup(\&func);
  Wharf::JDockApp::jtools::set_expose(\&func);
  Wharf::JDockApp::jtools::set_update(\&func);
  Wharf::JDockApp::jtools::set_button(\&func);

  Wharf::JDockApp::jtools::clear_window;
  Wharf::JDockApp::jtools::start_app;

  Wharf::JDockApp::jtools::set_update_delay($seconds);
  Wharf::JDockApp::jtools::set_loop_delay(1000);

=head1 DESCRIPTION

  You don't want to use this module.  It's the support module for JDockApp.
  I drain'd these functions and constants out of JDockApp, because I wanted
  whatever tools that may come next to be separate from these.

  Later there may be some tools for clearing the white grey line,
  adding little pictures and buttons, n' doing lines and circles;
  but those would come in like Wharf::JDockApp::geom_tools and 
  Wharf::JDockApp::buttons.  These docs are, therefore, basically just
  for completeness.  Well, and so if you follow the SEE ALSO white
  rabbit, you find something worth reading.  ;)

=head1 Exported constants

The number of colors for jprintf is quite limited.  
The reason?  The XPM 'code' is compiled into the binary.

  BLUE    - the color blue
  CYAN    - the color cyan
  GREEN   - the color green
  INDIGO  - the color indigo
  ORANGE  - the color orange
  PINK    - the color pink
  RED     - the color red
  VIOLET  - the color violet
  YELLOW  - the color yellow

=head1 AUTHOR

  Jettero Heller <jettero@voltar.org>

=head1 SEE ALSO

perl(1), Wharf::JDockApp(3), Wharf::JDockApp::jtools(3).

=cut
