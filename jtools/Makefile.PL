use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    'NAME'	=> 'Wharf::JDockApp::jtools',
    'VERSION_FROM' => 'jtools.pm',
    'LIBS'	=> ['-L/usr/X11R6/lib -lXpm -lX11 -lXext'],
    'DEFINE'	=> '-D$(shell echo `uname -s`)',
    'INC'	=> '-I/usr/X11R6/include/X11 -I/usr/X11R6/include -I.',
    'OBJECT'   => 'jtools.o jDockApp.o xutils.o jprintf.o'
);
