use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME'	         => 'Wharf::JDockApp',
    'VERSION_FROM'       => 'JDockApp.pm',
#    'PPM_INSTALL_EXEC'   => '/bin/sh',
#    'PPM_INSTALL_SCRIPT' => './further',  # these just don't work ...
);
