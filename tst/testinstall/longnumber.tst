#############################################################################
##
#A  longnumber.tst               GAP 4.0 library                Steve Linton
##
##
#Y  Copyright 2011,   The GAP Group
##  to be listed in testinstall.g
##  these tests deal with various cases in long integer parsing where the number has
##  to be read in one two or three blocks, which may sometimes be exactly filled or
##  sometimes end with a partial block.
##
##  To be extended with similar tests for all the cases of float and long-float 
##  parsing when I have a reliable way of testing them.
##
gap> START_TEST("longnumber.tst");

# integers
gap> x := 
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999;;
gap> x = 10^1000-1;
true
gap> x := 
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 999999999999999999999999999999999999999999999999999999999999999999999999999;;
gap> x = 10^1023-1;
true
gap> x := 
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999;;
gap> x = 10^1024-1;
true
gap> x := 
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999;;
gap> x = 10^2000-1;
true
gap> x := 
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 99999999999999999999999999999999999999999999999999999999999999999999999;;
gap> x = 10^2046-1;
true
gap> x := 
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 9999999999999999999999999999999999999999999999999999999999999999999999999999999\
> 999999999999999999999999999999999999999999999999999999999999999999999999;;
gap> x = 10^2047-1;
true

# Basic float formats
gap> 1.;
1.
gap> 0.;
0.
gap> .1;
0.1
gap> 0.1;
0.1
gap> 1111111111111111111111111111111111111.1;
1.11111e+36
gap> 1.11111111111111111111111111111111111111;
1.11111
gap> .;
Syntax error: Badly formed number, need a digit before or after the decimal po\
int in stream line 1
.;
^
gap> .n;
Syntax error: Badly formed number, need a digit before or after the decimal po\
int in stream line 1
.n;
^
gap> .q;
Syntax error: Badly formed number, need a digit before or after the decimal po\
int in stream line 1
.q;
^
gap> .0n;
fail
gap> .0q;
Syntax error: Badly Formed Number, need at least one digit in the exponent in \
stream line 1
.0q;
  ^
gap> .0qn;
Syntax error: Badly Formed Number, need at least one digit in the exponent in \
stream line 1
.0qn;
  ^
gap> Unbind(x);
gap> STOP_TEST( "longnumber.tst", 270000);

#############################################################################
##
#E
