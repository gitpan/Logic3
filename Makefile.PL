use ExtUtils::MakeMaker ;

# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.

WriteMakefile(
    'NAME'         => 'Logic3',
    'VERSION_FROM' => 'Logic3.pm', # finds $VERSION
    'DISTNAME'     => 'Logic3',
    ($] >= 5.005 ?
        (
            ABSTRACT => '3-value logic; both propagating and non-propagating nulls',
            AUTHOR   => 'Mark Summerfield <summer@chest.ac.uk>',
        ) : () ),
    'LIBS'         => [''],   # e.g., '-lm'
    'DEFINE'       => '',     # e.g., '-DHAVE_SOMETHING'
    'INC'          => '',     # e.g., '-I/usr/include/other'
    'dist'         => { COMPRESS => "gzip -9", SUFFIX => "gz" }
) ;
