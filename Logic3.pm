package Logic3 ;    # Documented at the __END__.

# $Id: Logic3.pm,v 1.3 1999/01/18 22:21:11 root Exp $

require 5.004 ;

use strict ;
use integer ;

use vars qw( $VERSION @ISA @EXPORT_OK %EXPORT_TAGS ) ;

$VERSION = '1.01' ;


use Exporter() ;

@ISA        = qw( Exporter ) ;

@EXPORT_OK  = qw( And Or Xor Not AND OR XOR NOT TRUE FALSE UNDEF ) ;

%EXPORT_TAGS = ( 
    Propagating    => [ qw( And Or Xor Not TRUE FALSE UNDEF ) ],
    NonPropagating => [ qw( AND OR XOR NOT TRUE FALSE UNDEF ) ],
    Constants      => [ qw( TRUE FALSE UNDEF ) ],
    ALL            => [ qw( And Or Xor Not TRUE FALSE UNDEF 
                            AND OR XOR NOT ) ],
    ) ;


### Exported Module Constants.

sub TRUE  () { 1 }
sub FALSE () { 0 } 
sub UNDEF () { undef }


### Propagates undefined #############################


#############################
sub And {
    my( $a, $b ) = @_ ;

    if( ( not defined $a ) or ( not defined $b ) ) {
        # At least one is undefined which propagates.
        UNDEF ;
    }
    elsif( $a and $b ) {
        # They're both defined and true.
        TRUE ;
    }
    else {
        # They're both defined and at least one is false.
        FALSE ;
    }
}


#############################
sub Or {
    my( $a, $b ) = @_ ;

    if( ( not defined $a ) or ( not defined $b ) ) {
        # At least one is undefined which propagates.
        UNDEF ;
    }
    elsif( $a or $b ) {
        # They're both defined and at least one is true.
        TRUE ;
    }
    else {
        # They're both defined and both are false.
        FALSE ;
    }
}


#############################
sub Xor {
    my( $a, $b ) = @_ ;

    if( ( not defined $a ) or ( not defined $b ) ) {
        # At least one is undefined which propagates.
        UNDEF ;
    }
    elsif( ( $a and $b ) or ( ( not $a ) and ( not $b ) ) ) {
        # Both are defined and they're both the same.
        # Could be expressed as: ( Not( $a ) == Not( $b ) ).
        FALSE ;
    }
    else {
        # Both are defined and they're different.
        TRUE ;
    }
}


#############################
sub Not {
    my( $a ) = @_ ;

    if( not defined $a ) {
        # It's undefined which propogates.
        UNDEF ;
    }
    elsif( $a ) {
        # It's defined and true so return false.
        FALSE ;
    }
    else {
        # It's defined and false so return true.
        TRUE ;
    }
}


### Does not propagate undefined #############################


#############################
sub AND {
    my( $a, $b ) = @_ ;

    if( $a and $b ) {
        # Both are defined and true.
        TRUE ;
    }
    elsif( ( ( defined $a ) and not $a ) or
           ( ( defined $b ) and not $b ) ) {
        # At least one is defined and false.
        FALSE ;
    }
    else {
        # Either both are undefined or only one is defined and true.
        UNDEF ;
    }
}


#############################
sub OR {
    my( $a, $b ) = @_ ;

    if( $a or $b ) {
        # At least one is defined and true.
        TRUE ;
    }
    elsif( ( not defined $a ) or ( not defined $b ) ) {
        # Either both are undefined or one is defined and false.
        UNDEF ;
    }
    else {
        # They're both defined and false.
        FALSE ;
    }
}


#############################
sub XOR {
    # Identical to Xor: included for the sake of orthogonality.
    Xor( @_ ) ;
}


#############################
sub NOT {
    # Identical to Not: included for the sake of orthogonality.
    Not( @_ ) ;
}


1 ;

__END__


=head1 NAME

Logic3 - Perl module providing 3-value logic versions of 
         "and", "or", "xor" and "not".

=head1 SYNOPSIS

    use Const ; # This module depends on the Const.pm module.

	use Logic3 qw( And Or Xor Not AND OR XOR NOT TRUE FALSE UNDEF ) ;

	use Logic3 ':ALL' ;

	use Logic3 ':Constants' ; # Gets constants TRUE FALSE UNDEF only.

	use Logic3 ':Propagating' ; # Gets constants and propagating functions.

	use Logic3 ':NonPropagating' ; # Gets constants and non-propagating funcs.

These functions are for scalars, literals and constants. (They don't
dereference so there's no point in sending them references since
references are always true.)

    # These propagate undefined.
    $result = And( $a, $b ) ;
    $result =  Or( $a, $b ) ;
    $result = Xor( $a, $b ) ;
    $result = Not( $a ) ;

    # These do not propagate undefined.
    $result = AND( $a, $b ) ;
    $result =  OR( $a, $b ) ;
    $result = XOR( $a, $b ) ;
    $result = NOT( $a ) ;

=head1 DESCRIPTION

Perl's built-in logical operators, C<and>, C<or>, C<xor> and C<not>
support two-value logic. This means that they always produce a result
which is either true or false. In fact perl sometimes returns 0 and
sometimes returns undef for false depending on the operator and the
order of the arguments. For "true" Perl generally returns the first 
value that evaluated to true which turns out to be extremely useful 
in practice. Given the choice Perl's built-in logical operators are 
to be preferred - but when you really want 3-value logic it is 
available through this module.

Three-value logic with the logical operators, C<And>, C<Or>, C<Xor>,
C<Not> and C<AND>, C<OR>, C<XOR>, C<NOT> provided in this module produce
one of three results: true, false or undefined. They are "pure" logical
operators in that they always return one of the constants, TRUE
(1), FALSE (0) or UNDEF (undef) rather than one of their inputs.

Three-value logic has two different truth tables for "and" and "or";
this module supports both. (In the Perl column F means F or U.)

Note that C<And>, C<Or>, C<Xor>, and C<Not> propagate undefined and
C<AND>, C<OR>, C<XOR>, and C<NOT> don't.

        Perl Logic3         Perl Logic3        Perl Logic3 
    A B and  And AND    A B or   Or  OR    A B xor  Xor XOR
    - - ---  --- ---    - - --   --  --    - - ---  --- ---
    U U  F    U   U     U U  F    U   U    U U  F    U   U 
    U F  F    U   F     U F  F    U   U    U F  F    U   U 
    F U  F    U   F     F U  F    U   U    F U  F    U   U 
    F F  F    F   F     F F  F    F   F    F F  F    F   F
    U T  F    U   U     U T  T    U   T    U T  T    U   U
    T U  F    U   U     T U  T    U   T    T U  T    U   U
    T T  T    T   T     T T  T    T   T    T T  F    F   F
    T F  F    F   F     T F  T    T   T    T F  T    T   T
    F T  F    F   F     F T  T    T   T    F T  T    T   T

         Perl Logic3
    A not  Not NOT
    - ---  --- ---
    U  T    U   U
    U  T    U   U
    F  T    T   T
    T  F    F   F

=head1 BUGS

Although we can use the following comparisons:
    ( $result == FALSE )
and
    ( $result == TRUE )
using
    ( $result == UNDEF )
will lead to complaints if you use -w (which you should of course), if
$result happens to be undefined, so the last comparison should be
re-written as follows:
    ( not defined $result )

=head1 CHANGES

1998/4/27   First release.

1998/6/25   First public release.

1999/01/18  Second public release.

1999/02/26  Changed TRUE, FALSE, UNDEF to standard perl-style constants.

=head1 AUTHOR

Mark Summerfield. I can be contacted as <mark.summerfield@chest.ac.uk> -
please include the word 'logic' in the subject line.

=head1 COPYRIGHT

Copyright (c) Mark Summerfield 1998/9. All Rights Reserved.

This module may be used/distributed/modified under the same terms as Perl
itself.

=cut


