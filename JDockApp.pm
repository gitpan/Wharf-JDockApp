package Wharf::JDockApp;

use strict;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK);

require Exporter;
require AutoLoader;

@ISA    = qw(Exporter AutoLoader);
@EXPORT = qw( 
    StartApp SetSetup SetExpose SetUpdate SetButton SetDelay ClearWindow
    BLUE CYAN GREEN INDIGO NUMBERS ORANGE PINK RED VIOLET YELLOW jprint jpprint
);
$VERSION = '1.2';

use Wharf::JDockApp::jtools;

return 1;

sub SetSetup  { Wharf::JDockApp::jtools::set_setup( shift); }
sub SetExpose { Wharf::JDockApp::jtools::set_expose(shift); }
sub SetUpdate { Wharf::JDockApp::jtools::set_update(shift); }
sub SetButton { Wharf::JDockApp::jtools::set_button(shift); }

sub StartApp    { Wharf::JDockApp::jtools::start_app(); }
sub ClearWindow { Wharf::JDockApp::jtools::clear_window(); }

sub SetDelay {
    Wharf::JDockApp::jtools::set_update_delay(shift);
    Wharf::JDockApp::jtools::set_loop_delay(1000);
}

__END__

=head1 NAME

JDockApp - Perl extension for doing Wharf or Window Maker dockapps.

=head1 SYNOPSIS

  use Wharf::JDockApp;

  SetSetup( \&some_func);
  SetExpose(\&some_func);
  SetUpdate(\&some_func);
  SetButton(\&some_func);

  SetDelay($delay)

  StartApp;
  ClearWindow;

  also:

  jpprint($x, $y, COLOR, "stuff");
  jprint(         COLOR, "stuff");

=head1 DESCRIPTION

    SetSetup  - called when the JDockApp starts
    SetExpose - called when the JDockApp is uncovered
                (it's uncovered when the app starts btw)
    SetUpdate - called every $delay seconds
    SetButton - called whenever someone clicks the JDockApp

    SetDelay  - You must give this function a number of 
                seconds--or an Illithid will eat your brain.

    When all your /Sets[SEB]/ are set, call StartApp.

    ClearWindow - This is a secret function.  Only use it
                  if you are in the know.  I'll not 
                  be held responsible if your dockapp
                  window is clear'd.  I simply will not.

    Brought with us from Wharf::JDockApp::jtools:

    jpprint - print some text at ($x, $y).
    jprint  - print some text ... starting where we left off.

        for both jprint and jpprint, COLOR is a constant

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

=head1 EXAMPLES

    There is an examples directory that comes with the distribution.
    In it is a copy of the wmjmail program.  It'll parse your mailbox
    (rather stupidly) to determin how many messages you have, and
    of them how many are new.  I couldn't figure out how to get the
    Makefile.PL -- without resorting to a total hack -- to install 
    the wmjmail script. If you can tell me how, please e-mail me
    and I'll alter the next distribution.

=head1 AUTHOR

  Jettero Heller <jettero@voltar.org>

=head1 SEE ALSO

perl(1), Wharf::JDockApp(3), Wharf::JDockApp::jtools(3).

=cut
