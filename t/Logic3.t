#!/usr/bin/perl -w

=pod

Test script for Logic3.pm

Copyright (c) Mark Summerfield 1998/9. All Rights Reserved. This program is
free software; you can redistribute it and/or modify it under the same terms
as Perl itself.

=cut

require 5.004 ;

use strict ;
use integer ;

use Logic3 ':ALL' ;

my $debugging = 0 ;
$debugging = 1 if $ARGV[0] and $ARGV[0] eq '-d' ;

print "       Perl          Logic3 undef-propagating  Logic3 non-propagating\n" ;

my( $a, $b, $result ) ;

$a = UNDEF ;

$result = not $a ;
print "       not U = ", ( ( $result == TRUE )   ? "T  OK\t" : "Failed\a\t" ) ;
$result = Not( $a ) ;
print "    Not( U ) = ", ( ( not defined $result ) ? "U  OK\t" : "Failed\a\t" ) ;
$result = NOT( $a ) ;
print "    NOT( U ) = ", ( ( not defined $result ) ? "U  OK\n" : "Failed\a\n" ) ;

$a = FALSE ;

$result = not $a ;
print "       not F = ", ( ( $result == TRUE )   ? "T  OK\t" : "Failed\a\t" ) ;
$result = Not( $a ) ;
print "    Not( F ) = ", ( ( $result == TRUE )   ? "T  OK\t" : "Failed\a\t" ) ;
$result = NOT( $a ) ;
print "    NOT( F ) = ", ( ( $result == TRUE )   ? "T  OK\n" : "Failed\a\n" ) ;

$a = TRUE ;

$result = not $a ;
print "       not T = ", ( ( $result == FALSE )  ? "F  OK\t" : "Failed\a\t" ) ;
$result = Not( $a ) ;
print "    Not( T ) = ", ( ( $result == FALSE )  ? "F  OK\t" : "Failed\a\t" ) ;
$result = NOT( $a ) ;
print "    NOT( T ) = ", ( ( $result == FALSE )  ? "F  OK\n" : "Failed\a\n" ) ;


( $a, $b ) = ( UNDEF, UNDEF ) ;
$result = ( $a and $b ) ;
print "     U and U = ", ( ( not $result )         ? "UF OK\t" : "Failed\a\t" ) ;
$result = And( $a, $b ) ;
print " And( U, U ) = ", ( ( not defined $result ) ? "U  OK\t" : "Failed\a\t" ) ;
$result = AND( $a, $b ) ;
print " AND( U, U ) = ", ( ( not defined $result ) ? "U  OK\n" : "Failed\a\n" ) ;

( $a, $b ) = ( UNDEF, FALSE ) ;
$result = ( $a and $b ) ;
print "     U and F = ", ( ( not $result )         ? "UF OK\t" : "Failed\a\t" ) ;
$result = And( $a, $b ) ;
print " And( U, F ) = ", ( ( not defined $result ) ? "U  OK\t" : "Failed\a\t" ) ;
$result = AND( $a, $b ) ;
print " AND( U, F ) = ", ( ( $result == FALSE )  ? "F  OK\n" : "Failed\a\n" ) ;

( $a, $b ) = ( FALSE, UNDEF ) ;
$result = ( $a and $b ) ;
print "     F and U = ", ( ( $result == FALSE )  ? "F  OK\t" : "Failed\a\t" ) ;
$result = And( $a, $b ) ;
print " And( F, U ) = ", ( ( not defined $result ) ? "U  OK\t" : "Failed\a\t" ) ;
$result = AND( $a, $b ) ;
print " AND( F, U ) = ", ( ( $result == FALSE )  ? "F  OK\n" : "Failed\a\n" ) ;

( $a, $b ) = ( FALSE, FALSE ) ;
$result = ( $a and $b ) ;
print "     F and F = ", ( ( $result == FALSE )  ? "F  OK\t" : "Failed\a\t" ) ;
$result = And( $a, $b ) ;
print " And( F, F ) = ", ( ( $result == FALSE )  ? "F  OK\t" : "Failed\a\t" ) ;
$result = AND( $a, $b ) ;
print " AND( F, F ) = ", ( ( $result == FALSE )  ? "F  OK\n" : "Failed\a\n" ) ;

( $a, $b ) = ( UNDEF, TRUE ) ;
$result = ( $a and $b ) ;
print "     U and T = ", ( ( not $result )         ? "UF OK\t" : "Failed\a\t" ) ;
$result = And( $a, $b ) ;
print " And( U, T ) = ", ( ( not defined $result ) ? "U  OK\t" : "Failed\a\t" ) ;
$result = AND( $a, $b ) ;
print " AND( U, T ) = ", ( ( not defined $result ) ? "U  OK\n" : "Failed\a\n" ) ;

( $a, $b ) = ( TRUE, UNDEF ) ;
$result = ( $a and $b ) ;
print "     T and U = ", ( ( not $result )         ? "UF OK\t" : "Failed\a\t" ) ;
$result = And( $a, $b ) ;
print " And( T, U ) = ", ( ( not defined $result ) ? "U  OK\t" : "Failed\a\t" ) ;
$result = AND( $a, $b ) ;
print " AND( T, U ) = ", ( ( not defined $result ) ? "U  OK\n" : "Failed\a\n" ) ;

( $a, $b ) = ( TRUE, TRUE ) ;
$result = ( $a and $b ) ;
print "     T and T = ", ( ( $result == TRUE )   ? "T  OK\t" : "Failed\a\t" ) ;
$result = And( $a, $b ) ;
print " And( T, T ) = ", ( ( $result == TRUE )   ? "T  OK\t" : "Failed\a\t" ) ;
$result = AND( $a, $b ) ;
print " AND( T, T ) = ", ( ( $result == TRUE )   ? "T  OK\n" : "Failed\a\n" ) ;

( $a, $b ) = ( TRUE, FALSE ) ;
$result = ( $a and $b ) ;
print "     T and F = ", ( ( $result == FALSE )  ? "F  OK\t" : "Failed\a\t" ) ;
$result = And( $a, $b ) ;
print " And( T, F ) = ", ( ( $result == FALSE )  ? "F  OK\t" : "Failed\a\t" ) ;
$result = AND( $a, $b ) ;
print " AND( T, F ) = ", ( ( $result == FALSE )  ? "F  OK\n" : "Failed\a\n" ) ;

( $a, $b ) = ( FALSE, TRUE ) ;
$result = ( $a and $b ) ;
print "     F and T = ", ( ( $result == FALSE )  ? "F  OK\t" : "Failed\a\t" ) ;
$result = And( $a, $b ) ;
print " And( F, T ) = ", ( ( $result == FALSE )  ? "F  OK\t" : "Failed\a\t" ) ;
$result = AND( $a, $b ) ;
print " AND( F, T ) = ", ( ( $result == FALSE )  ? "F  OK\n" : "Failed\a\n" ) ;

&newpage if $debugging ;

( $a, $b ) = ( UNDEF, UNDEF ) ;
$result = ( $a or $b ) ;
print "     U or  U = ", ( ( not $result )         ? "UF OK\t" : "Failed\a\t" ) ;
$result = Or( $a, $b ) ;
print "  Or( U, U ) = ", ( ( not defined $result ) ? "U  OK\t" : "Failed\a\t" ) ;
$result = OR( $a, $b ) ;
print "  OR( U, U ) = ", ( ( not defined $result ) ? "U  OK\n" : "Failed\a\n" ) ;

( $a, $b ) = ( UNDEF, FALSE ) ;
$result = ( $a or $b ) ;
print "     U or  F = ", ( ( $result == FALSE )  ? "F  OK\t" : "Failed\a\t" ) ;
$result = Or( $a, $b ) ;
print "  Or( U, F ) = ", ( ( not defined $result ) ? "U  OK\t" : "Failed\a\t" ) ;
$result = OR( $a, $b ) ;
print "  OR( U, F ) = ", ( ( not defined $result ) ? "U  OK\n" : "Failed\a\n" ) ;

( $a, $b ) = ( FALSE, UNDEF ) ;
$result = ( $a or $b ) ;
print "     F or  U = ", ( ( not $result )         ? "UF OK\t" : "Failed\a\t" ) ;
$result = Or( $a, $b ) ;
print "  Or( F, U ) = ", ( ( not defined $result ) ? "U  OK\t" : "Failed\a\t" ) ;
$result = OR( $a, $b ) ;
print "  OR( F, U ) = ", ( ( not defined $result ) ? "U  OK\n" : "Failed\a\n" ) ;

( $a, $b ) = ( FALSE, FALSE ) ;
$result = ( $a or $b ) ;
print "     F or  F = ", ( ( $result == FALSE )  ? "F  OK\t" : "Failed\a\t" ) ;
$result = Or( $a, $b ) ;
print "  Or( F, F ) = ", ( ( $result == FALSE )  ? "F  OK\t" : "Failed\a\t" ) ;
$result = OR( $a, $b ) ;
print "  OR( F, F ) = ", ( ( $result == FALSE )  ? "F  OK\n" : "Failed\a\n" ) ;

( $a, $b ) = ( UNDEF, TRUE ) ;
$result = ( $a or $b ) ;
print "     U or  T = ", ( ( $result == TRUE )   ? "T  OK\t" : "Failed\a\t" ) ;
$result = Or( $a, $b ) ;
print "  Or( U, T ) = ", ( ( not defined $result ) ? "U  OK\t" : "Failed\a\t" ) ;
$result = OR( $a, $b ) ;
print "  OR( U, T ) = ", ( ( $result == TRUE )   ? "T  OK\n" : "Failed\a\n" ) ;

( $a, $b ) = ( TRUE, UNDEF ) ;
$result = ( $a or $b ) ;
print "     T or  U = ", ( ( $result == TRUE )   ? "T  OK\t" : "Failed\a\t" ) ;
$result = Or( $a, $b ) ;
print "  Or( T, U ) = ", ( ( not defined $result ) ? "U  OK\t" : "Failed\a\t" ) ;
$result = OR( $a, $b ) ;
print "  OR( T, U ) = ", ( ( $result == TRUE )   ? "T  OK\n" : "Failed\a\n" ) ;

( $a, $b ) = ( TRUE, TRUE ) ;
$result = ( $a or $b ) ;
print "     T or  T = ", ( ( $result == TRUE )   ? "T  OK\t" : "Failed\a\t" ) ;
$result = Or( $a, $b ) ;
print "  Or( T, T ) = ", ( ( $result == TRUE )   ? "T  OK\t" : "Failed\a\t" ) ;
$result = OR( $a, $b ) ;
print "  OR( T, T ) = ", ( ( $result == TRUE )   ? "T  OK\n" : "Failed\a\n" ) ;

( $a, $b ) = ( TRUE, FALSE ) ;
$result = ( $a or $b ) ;
print "     T or  F = ", ( ( $result == TRUE )   ? "T  OK\t" : "Failed\a\t" ) ;
$result = Or( $a, $b ) ;
print "  Or( T, F ) = ", ( ( $result == TRUE )   ? "T  OK\t" : "Failed\a\t" ) ;
$result = OR( $a, $b ) ;
print "  OR( T, F ) = ", ( ( $result == TRUE )   ? "T  OK\n" : "Failed\a\n" ) ;

( $a, $b ) = ( FALSE, TRUE ) ;
$result = ( $a or $b ) ;
print "     F or  T = ", ( ( $result == TRUE )   ? "T  OK\t" : "Failed\a\t" ) ;
$result = Or( $a, $b ) ;
print "  Or( F, T ) = ", ( ( $result == TRUE )   ? "T  OK\t" : "Failed\a\t" ) ;
$result = OR( $a, $b ) ;
print "  OR( F, T ) = ", ( ( $result == TRUE )   ? "T  OK\n" : "Failed\a\n" ) ;

&newpage if $debugging ;


( $a, $b ) = ( UNDEF, UNDEF ) ;
$result = ( $a xor $b ) ;
print "     U xor U = ", ( ( not $result )         ? "UF OK\t" : "Failed\a\t" ) ;
$result = Xor( $a, $b ) ;
print " Xor( U, U ) = ", ( ( not defined $result ) ? "U  OK\t" : "Failed\a\t" ) ;
$result = XOR( $a, $b ) ;
print " XOR( U, U ) = ", ( ( not defined $result ) ? "U  OK\n" : "Failed\a\n" ) ;
( $a, $b ) = ( UNDEF, FALSE ) ;
$result = ( $a xor $b ) ;
print "     U xor F = ", ( ( $result == FALSE )  ? "F  OK\t" : "Failed\a\t" ) ;
$result = Xor( $a, $b ) ;
print " Xor( U, F ) = ", ( ( not defined $result ) ? "U  OK\t" : "Failed\a\t" ) ;
$result = XOR( $a, $b ) ;
print " XOR( U, F ) = ", ( ( not defined $result ) ? "U  OK\n" : "Failed\a\n" ) ;
( $a, $b ) = ( FALSE, UNDEF ) ;
$result = ( $a xor $b ) ;
print "     F xor U = ", ( ( not $result )         ? "UF OK\t" : "Failed\a\t" ) ;
$result = Xor( $a, $b ) ;
print " Xor( F, U ) = ", ( ( not defined $result ) ? "U  OK\t" : "Failed\a\t" ) ;
$result = XOR( $a, $b ) ;
print " XOR( F, U ) = ", ( ( not defined $result ) ? "U  OK\n" : "Failed\a\n" ) ;
( $a, $b ) = ( FALSE, FALSE ) ;
$result = ( $a xor $b ) ;
print "     F xor F = ", ( ( $result == FALSE )  ? "F  OK\t" : "Failed\a\t" ) ;
$result = Xor( $a, $b ) ;
print " Xor( F, F ) = ", ( ( $result == FALSE )  ? "F  OK\t" : "Failed\a\t" ) ;
$result = XOR( $a, $b ) ;
print " XOR( F, F ) = ", ( ( $result == FALSE )  ? "F  OK\n" : "Failed\a\n" ) ;
( $a, $b ) = ( UNDEF, TRUE ) ;
$result = ( $a xor $b ) ;
print "     U xor T = ", ( ( $result == TRUE )   ? "T  OK\t" : "Failed\a\t" ) ;
$result = Xor( $a, $b ) ;
print " Xor( U, T ) = ", ( ( not defined $result ) ? "U  OK\t" : "Failed\a\t" ) ;
$result = XOR( $a, $b ) ;
print " XOR( U, T ) = ", ( ( not defined $result ) ? "U  OK\n" : "Failed\a\n" ) ;
( $a, $b ) = ( TRUE, UNDEF ) ;
$result = ( $a xor $b ) ;
print "     T xor U = ", ( ( $result == TRUE )   ? "T  OK\t" : "Failed\a\t" ) ;
$result = Xor( $a, $b ) ;
print " Xor( T, U ) = ", ( ( not defined $result ) ? "U  OK\t" : "Failed\a\t" ) ;
$result = XOR( $a, $b ) ;
print " XOR( T, U ) = ", ( ( not defined $result ) ? "U  OK\n" : "Failed\a\n" ) ;
( $a, $b ) = ( TRUE, TRUE ) ;
$result = ( $a xor $b ) ;
print "     T xor T = ", ( ( $result == FALSE )   ? "T  OK\t" : "Failed\a\t" ) ;
$result = Xor( $a, $b ) ;
print " Xor( T, T ) = ", ( ( $result == FALSE )   ? "T  OK\t" : "Failed\a\t" ) ;
$result = XOR( $a, $b ) ;
print " XOR( T, T ) = ", ( ( $result == FALSE )   ? "T  OK\n" : "Failed\a\n" ) ;
( $a, $b ) = ( TRUE, FALSE ) ;
$result = ( $a xor $b ) ;
print "     T xor F = ", ( ( $result == TRUE )   ? "T  OK\t" : "Failed\a\t" ) ;
$result = Xor( $a, $b ) ;
print " Xor( T, F ) = ", ( ( $result == TRUE )   ? "T  OK\t" : "Failed\a\t" ) ;
$result = XOR( $a, $b ) ;
print " XOR( T, F ) = ", ( ( $result == TRUE )   ? "T  OK\n" : "Failed\a\n" ) ;
( $a, $b ) = ( FALSE, TRUE ) ;
$result = ( $a xor $b ) ;
print "     F xor T = ", ( ( $result == TRUE )   ? "T  OK\t" : "Failed\a\t" ) ;
$result = Xor( $a, $b ) ;
print " Xor( F, T ) = ", ( ( $result == TRUE )   ? "T  OK\t" : "Failed\a\t" ) ;
$result = XOR( $a, $b ) ;
print " XOR( F, T ) = ", ( ( $result == TRUE )   ? "T  OK\n" : "Failed\a\n" ) ;


sub newpage {
    print "[MORE]" ;
    my $dummy = <STDIN> ;
    print "       Perl          Logic3 undef-propagating  Logic3 non-propagating\n" ;
}

