# vi:fdm=marker fdl=0 syntax=perl:
# $Id: main.t,v 1.9 2003/07/31 19:35:05 jettero Exp $

use strict;
use Test;

    plan tests => 2;

use Wharf::JDockApp; ok 1;

my $count = 0;

SetSetup( \&setup);
SetExpose(\&expose);
SetUpdate(\&update);
SetButton(\&button);

alarm 2;

$SIG{ALRM} = sub {ok 2; exit 0}; # don't run away on us... But we need to test for sagfaults

StartApp;

sub setup  { 
    $count = 10;
    SetDelay(1);
}

sub update { 
    ClearWindow;
    $count++;

    jpprint(0, 0, YELLOW, "  J-testing");
    jpprint(2, 2, PINK,   "hi");
    jpprint(3, 3, PINK,   "there");
    jpprint(0, 5, GREEN,  "count: ");
    jprint(BLUE, "$count");
}

sub expose { 
    &update;
}

sub button { 
    $count = 0;
    &update;
}
