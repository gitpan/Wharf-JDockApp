BEGIN { $| = 1; print "1..1\n"; }
END {print "not ok 1\n" unless $loaded;}

use Wharf::JDockApp;

$loaded = 1;
print "ok 1\n";

exit 0;

########## DockApp Below! ;)

SetSetup( \&setup);
SetExpose(\&expose);
SetUpdate(\&update);
SetButton(\&button);

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
