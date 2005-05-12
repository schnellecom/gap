#############################################################################
##
#W  rwspcgrp.tst                GAP library                      Frank Celler
##
#H  @(#)$Id$
##
#Y  Copyright (C)  1996,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  To be listed in testall.g
##

gap> START_TEST("$Id$");


#############################################################################

# create a free group, 8 bits
gap> f := FreeGroup(11);; # deliberately not syllable rep to test old version
gap> g := GeneratorsOfGroup(f){[1..11]};;

# use 'fn' as abbreviation of 'g[n]'
gap> f1 := g[1];;
gap> f2 := g[2];;
gap> f3 := g[3];;
gap> f4 := g[4];;
gap> f5 := g[5];;
gap> f6 := g[6];;
gap> f7 := g[7];;
gap> f8 := g[8];;
gap> f9 := g[9];;
gap> f10 := g[10];;
gap> f11 := g[11];;

# store the relators in <r>
gap> r := [

# power relators
> [ 1, f2*f9 ],

# commutator relators
> [ 6, 1, f9*f10*f11 ], [ 7, 1, f9*f11 ], [ 8, 1, f9*f10 ], [ 3, 2,
> f9*f11 ], [ 5, 2, f9*f10 ], [ 5, 3, f5 ], [ 7, 3, f8 ], [ 8, 3,
> f7*f8 ], [ 9, 3, f9*f11 ], [ 10, 3, f9*f10 ], [ 11, 3, f10*f11 ], [
> 6, 5, f6*f8 ], [ 7, 5, f6*f7*f8 ], [ 8, 5, f7*f8 ], [ 9, 5, f9*f10
> ], [ 10, 5, f9*f11 ], [ 11, 5, f10 ] ];;

# construct a new single collector
gap> rws := SingleCollector( g, [ 2, 2, 3, 3, 7, 2, 2, 2, 2, 2, 2 ] );
<<single collector, 8 Bits>>

# set the relators
gap> for x  in r  do
>        if 2 = Length(x)  then
>            SetPower( rws, x[1], x[2] );
>        else
>            SetCommutator( rws, x[1], x[2], x[3] );
>        fi;
>    od;

# construct the group
gap> grp := GroupByRwsNC(rws);;
gap> g   := GeneratorsOfGroup(grp);;
gap> IsConfluent(grp);
true

# construct the maximal word
gap> l := [1..11]*0;;
gap> r := RelativeOrders(rws);;
gap> w := Product( List( [1..11], x -> g[x]^(r[x]-1) ) );;
gap> Print(ExtRepOfObj(w),"\n");
[ 1, 1, 2, 1, 3, 2, 4, 2, 5, 6, 6, 1, 7, 1, 8, 1, 9, 1, 10, 1, 11, 1 ]

# start multiplying around with <w>
gap> Print(ExtRepOfObj( w*w ),"\n");
[ 2, 1, 3, 1, 4, 1, 5, 2, 9, 1, 11, 1 ]

gap> Print(ExtRepOfObj( w^-1 ),"\n");
[ 1, 1, 3, 1, 4, 1, 5, 2, 6, 1, 7, 1, 8, 1, 9, 1, 11, 1 ]

gap> Print(ExtRepOfObj( w^1000 ),"\n");
[ 3, 2, 4, 2, 5, 6, 9, 1, 10, 1, 11, 1 ]

gap> l := GeneratorsOfGroup(grp);;
gap> p := One(grp);;
gap> for i  in l  do 
>        p := p * w * i;
>    od;
gap> Print(ExtRepOfObj(p),"\n");
[ 3, 2, 4, 2, 5, 3, 6, 1, 8, 1, 9, 1 ]

gap> l := GeneratorsOfGroup(grp);;
gap> p := One(grp);;
gap> for i  in l  do 
>        p := p * w * i * w;
>    od;
gap> Print(ExtRepOfObj(p),"\n");
[ 1, 1, 6, 1, 8, 1, 11, 1 ]

gap> Print(ExtRepOfObj( Comm( w, w ) ),"\n");
[  ]

gap> a := w * w * w;;
gap> Print(ExtRepOfObj(a),"\n");
[ 1, 1, 6, 1, 7, 1, 8, 1 ]

gap> a := a * a;;
gap> Print(ExtRepOfObj(a),"\n");
[ 2, 1 ]

gap> a := a * a;;
gap> Print(ExtRepOfObj(a),"\n");
[  ]

gap> Print(ExtRepOfObj( LeftQuotient( w*w, w ) ),"\n");
[ 1, 1, 3, 1, 4, 1, 5, 2, 6, 1, 7, 1, 8, 1, 9, 1, 11, 1 ]

gap> Print(ExtRepOfObj( w^-1 ),"\n");
[ 1, 1, 3, 1, 4, 1, 5, 2, 6, 1, 7, 1, 8, 1, 9, 1, 11, 1 ]

gap> Print(ExtRepOfObj( w^0 ),"\n");
[  ]

gap> Print(ExtRepOfObj( w^1 ),"\n");
[ 1, 1, 2, 1, 3, 2, 4, 2, 5, 6, 6, 1, 7, 1, 8, 1, 9, 1, 10, 1, 11, 1 ]

gap> Print(ExtRepOfObj( w^2 ),"\n");
[ 2, 1, 3, 1, 4, 1, 5, 2, 9, 1, 11, 1 ]

gap> Print(ExtRepOfObj( w^3 ),"\n");
[ 1, 1, 6, 1, 7, 1, 8, 1 ]

gap> Print(ExtRepOfObj( w^4 ),"\n");
[ 3, 2, 4, 2, 5, 6, 9, 1, 10, 1, 11, 1 ]

gap> Print(ExtRepOfObj( w^5 ),"\n");
[ 1, 1, 2, 1, 3, 1, 4, 1, 5, 2, 6, 1, 7, 1, 8, 1, 9, 1, 11, 1 ]

gap> Print(ExtRepOfObj( Comm( w, w ) ),"\n");
[  ]

gap> Print(ExtRepOfObj( Comm( w, l[1] ) ),"\n");
[ 9, 1 ]

gap> Print(ExtRepOfObj( LeftQuotient( w, w ) )  ,"\n") ;
[  ]

gap> Print(ExtRepOfObj( LeftQuotient( w, l[1] ) ),"\n");
[ 2, 1, 3, 1, 4, 1, 5, 2, 6, 1, 7, 1, 8, 1, 9, 1, 11, 1 ]

gap> Print(ExtRepOfObj( One(grp) ),"\n");
[  ]

gap> Print(ExtRepOfObj( w / w ),"\n");
[  ]

gap> Print(ExtRepOfObj( w / l[1] ),"\n");
[ 2, 1, 3, 2, 4, 2, 5, 6, 6, 1, 7, 1, 8, 1, 10, 1, 11, 1 ]


#############################################################################

# create a free group, 16 bits
gap> f := FreeGroup(IsSyllableWordsFamily,61);;
gap> g := GeneratorsOfGroup(f){[1..61]};;

# use 'fn' as abbreviation of 'g[n]'
gap> f1 := g[1];;
gap> f2 := g[2];;
gap> f3 := g[3];;
gap> f4 := g[4];;
gap> f5 := g[5];;
gap> f6 := g[6];;
gap> f7 := g[7];;
gap> f8 := g[8];;
gap> f9 := g[9];;
gap> f10 := g[10];;
gap> f11 := g[11];;
gap> f12 := g[12];;
gap> f13 := g[13];;
gap> f14 := g[14];;
gap> f15 := g[15];;
gap> f16 := g[16];;
gap> f17 := g[17];;
gap> f18 := g[18];;
gap> f19 := g[19];;
gap> f20 := g[20];;
gap> f21 := g[21];;
gap> f22 := g[22];;
gap> f23 := g[23];;
gap> f24 := g[24];;
gap> f25 := g[25];;
gap> f26 := g[26];;
gap> f27 := g[27];;
gap> f28 := g[28];;
gap> f29 := g[29];;
gap> f30 := g[30];;
gap> f31 := g[31];;
gap> f32 := g[32];;
gap> f33 := g[33];;
gap> f34 := g[34];;
gap> f35 := g[35];;
gap> f36 := g[36];;
gap> f37 := g[37];;
gap> f38 := g[38];;
gap> f39 := g[39];;
gap> f40 := g[40];;
gap> f41 := g[41];;
gap> f42 := g[42];;
gap> f43 := g[43];;
gap> f44 := g[44];;
gap> f45 := g[45];;
gap> f46 := g[46];;
gap> f47 := g[47];;
gap> f48 := g[48];;
gap> f49 := g[49];;
gap> f50 := g[50];;
gap> f51 := g[51];;
gap> f52 := g[52];;
gap> f53 := g[53];;
gap> f54 := g[54];;
gap> f55 := g[55];;
gap> f56 := g[56];;
gap> f57 := g[57];;
gap> f58 := g[58];;
gap> f59 := g[59];;
gap> f60 := g[60];;
gap> f61 := g[61];;

# store the relators in <r>
gap> r := [

# power relators
> [ 8, f9 ], [ 15, f16 ], [ 22, f23 ], [ 29, f30 ], [ 36, f37 ], [ 43,
> f44 ], [ 50, f51 ], [ 57, f58 ],

# commutator relators
> [ 2, 1, f2 ], [ 4, 1, f5 ], [ 5, 1, f4*f5 ], [ 13, 1, f13^2*f20 ], [
> 14, 1, f14^30*f21 ], [ 15, 1, f15*f16*f22 ], [ 16, 1, f16*f23 ], [
> 17, 1, f17^4*f24 ], [ 18, 1, f18^4*f25 ], [ 19, 1, f19^4*f26 ], [
> 20, 1, f20^2*f27 ], [ 21, 1, f21^30*f28 ], [ 22, 1, f22*f23*f29 ], [
> 23, 1, f23*f30 ], [ 24, 1, f24^4*f31 ], [ 25, 1, f25^4*f32 ], [ 26,
> 1, f26^4*f33 ], [ 27, 1, f13*f27^2 ], [ 28, 1, f14*f28^30 ], [ 29,
> 1, f15*f29*f30 ], [ 30, 1, f16*f30 ], [ 31, 1, f17*f31^4 ], [ 32, 1,
> f18*f32^4 ], [ 33, 1, f19*f33^4 ], [ 41, 1, f41^2*f48 ], [ 42, 1,
> f42^30*f49 ], [ 43, 1, f43*f44*f50 ], [ 44, 1, f44*f51 ], [ 45, 1,
> f45^4*f52 ], [ 46, 1, f46^4*f53 ], [ 47, 1, f47^4*f54 ], [ 48, 1,
> f48^2*f55 ], [ 49, 1, f49^30*f56 ], [ 50, 1, f50*f51*f57 ], [ 51, 1,
> f51*f58 ], [ 52, 1, f52^4*f59 ], [ 53, 1, f53^4*f60 ], [ 54, 1,
> f54^4*f61 ], [ 55, 1, f41*f55^2 ], [ 56, 1, f42*f56^30 ], [ 57, 1,
> f43*f57*f58 ], [ 58, 1, f44*f58 ], [ 59, 1, f45*f59^4 ], [ 60, 1,
> f46*f60^4 ], [ 61, 1, f47*f61^4 ], [ 3, 2, f3*f5 ], [ 4, 2, f3*f4*f5
> ], [ 5, 2, f4*f5 ], [ 13, 2, f13^2*f20 ], [ 14, 2, f14^30*f21 ], [
> 15, 2, f15*f16*f22 ], [ 16, 2, f16*f23 ], [ 17, 2, f17^4*f24 ], [
> 18, 2, f18^4*f25 ], [ 19, 2, f19^4*f26 ], [ 20, 2, f20^2*f41 ], [
> 21, 2, f21^30*f42 ], [ 22, 2, f22*f23*f43 ], [ 23, 2, f23*f44 ], [
> 24, 2, f24^4*f45 ], [ 25, 2, f25^4*f46 ], [ 26, 2, f26^4*f47 ], [
> 27, 2, f27^2*f55 ], [ 28, 2, f28^30*f56 ], [ 29, 2, f29*f30*f57 ], [
> 30, 2, f30*f58 ], [ 31, 2, f31^4*f59 ], [ 32, 2, f32^4*f60 ], [ 33,
> 2, f33^4*f61 ], [ 34, 2, f13*f34^2 ], [ 35, 2, f14*f35^30 ], [ 36,
> 2, f15*f36*f37 ], [ 37, 2, f16*f37 ], [ 38, 2, f17*f38^4 ], [ 39, 2,
> f18*f39^4 ], [ 40, 2, f19*f40^4 ], [ 41, 2, f27*f41^2 ], [ 42, 2,
> f28*f42^30 ], [ 43, 2, f29*f43*f44 ], [ 44, 2, f30*f44 ], [ 45, 2,
> f31*f45^4 ], [ 46, 2, f32*f46^4 ], [ 47, 2, f33*f47^4 ], [ 48, 2,
> f34*f48^2 ], [ 49, 2, f35*f49^30 ], [ 50, 2, f36*f50*f51 ], [ 51, 2,
> f37*f51 ], [ 52, 2, f38*f52^4 ], [ 53, 2, f39*f53^4 ], [ 54, 2,
> f40*f54^4 ], [ 55, 2, f48*f55^2 ], [ 56, 2, f49*f56^30 ], [ 57, 2,
> f50*f57*f58 ], [ 58, 2, f51*f58 ], [ 59, 2, f52*f59^4 ], [ 60, 2,
> f53*f60^4 ], [ 61, 2, f54*f61^4 ], [ 6, 3, f6^2*f34 ], [ 7, 3,
> f7^30*f35 ], [ 8, 3, f8*f9*f36 ], [ 9, 3, f9*f37 ], [ 10, 3,
> f10^4*f38 ], [ 11, 3, f11^4*f39 ], [ 12, 3, f12^4*f40 ], [ 13, 3,
> f13^2*f41 ], [ 14, 3, f14^30*f42 ], [ 15, 3, f15*f16*f43 ], [ 16, 3,
> f16*f44 ], [ 17, 3, f17^4*f45 ], [ 18, 3, f18^4*f46 ], [ 19, 3,
> f19^4*f47 ], [ 20, 3, f20^2*f48 ], [ 21, 3, f21^30*f49 ], [ 22, 3,
> f22*f23*f50 ], [ 23, 3, f23*f51 ], [ 24, 3, f24^4*f52 ], [ 25, 3,
> f25^4*f53 ], [ 26, 3, f26^4*f54 ], [ 27, 3, f27^2*f55 ], [ 28, 3,
> f28^30*f56 ], [ 29, 3, f29*f30*f57 ], [ 30, 3, f30*f58 ], [ 31, 3,
> f31^4*f59 ], [ 32, 3, f32^4*f60 ], [ 33, 3, f33^4*f61 ], [ 34, 3,
> f6*f34^2 ], [ 35, 3, f7*f35^30 ], [ 36, 3, f8*f36*f37 ], [ 37, 3,
> f9*f37 ], [ 38, 3, f10*f38^4 ], [ 39, 3, f11*f39^4 ], [ 40, 3,
> f12*f40^4 ], [ 41, 3, f13*f41^2 ], [ 42, 3, f14*f42^30 ], [ 43, 3,
> f15*f43*f44 ], [ 44, 3, f16*f44 ], [ 45, 3, f17*f45^4 ], [ 46, 3,
> f18*f46^4 ], [ 47, 3, f19*f47^4 ], [ 48, 3, f20*f48^2 ], [ 49, 3,
> f21*f49^30 ], [ 50, 3, f22*f50*f51 ], [ 51, 3, f23*f51 ], [ 52, 3,
> f24*f52^4 ], [ 53, 3, f25*f53^4 ], [ 54, 3, f26*f54^4 ], [ 55, 3,
> f27*f55^2 ], [ 56, 3, f28*f56^30 ], [ 57, 3, f29*f57*f58 ], [ 58, 3,
> f30*f58 ], [ 59, 3, f31*f59^4 ], [ 60, 3, f32*f60^4 ], [ 61, 3,
> f33*f61^4 ], [ 6, 4, f6^2*f20 ], [ 7, 4, f7^30*f21 ], [ 8, 4,
> f8*f9*f22 ], [ 9, 4, f9*f23 ], [ 10, 4, f10^4*f24 ], [ 11, 4,
> f11^4*f25 ], [ 12, 4, f12^4*f26 ], [ 13, 4, f13^2*f27 ], [ 14, 4,
> f14^30*f28 ], [ 15, 4, f15*f16*f29 ], [ 16, 4, f16*f30 ], [ 17, 4,
> f17^4*f31 ], [ 18, 4, f18^4*f32 ], [ 19, 4, f19^4*f33 ], [ 20, 4,
> f6*f20^2 ], [ 21, 4, f7*f21^30 ], [ 22, 4, f8*f22*f23 ], [ 23, 4,
> f9*f23 ], [ 24, 4, f10*f24^4 ], [ 25, 4, f11*f25^4 ], [ 26, 4,
> f12*f26^4 ], [ 27, 4, f13*f27^2 ], [ 28, 4, f14*f28^30 ], [ 29, 4,
> f15*f29*f30 ], [ 30, 4, f16*f30 ], [ 31, 4, f17*f31^4 ], [ 32, 4,
> f18*f32^4 ], [ 33, 4, f19*f33^4 ], [ 34, 4, f34^2*f48 ], [ 35, 4,
> f35^30*f49 ], [ 36, 4, f36*f37*f50 ], [ 37, 4, f37*f51 ], [ 38, 4,
> f38^4*f52 ], [ 39, 4, f39^4*f53 ], [ 40, 4, f40^4*f54 ], [ 41, 4,
> f41^2*f55 ], [ 42, 4, f42^30*f56 ], [ 43, 4, f43*f44*f57 ], [ 44, 4,
> f44*f58 ], [ 45, 4, f45^4*f59 ], [ 46, 4, f46^4*f60 ], [ 47, 4,
> f47^4*f61 ], [ 48, 4, f34*f48^2 ], [ 49, 4, f35*f49^30 ], [ 50, 4,
> f36*f50*f51 ], [ 51, 4, f37*f51 ], [ 52, 4, f38*f52^4 ], [ 53, 4,
> f39*f53^4 ], [ 54, 4, f40*f54^4 ], [ 55, 4, f41*f55^2 ], [ 56, 4,
> f42*f56^30 ], [ 57, 4, f43*f57*f58 ], [ 58, 4, f44*f58 ], [ 59, 4,
> f45*f59^4 ], [ 60, 4, f46*f60^4 ], [ 61, 4, f47*f61^4 ], [ 6, 5,
> f6^2*f13 ], [ 7, 5, f7^30*f14 ], [ 8, 5, f8*f9*f15 ], [ 9, 5, f9*f16
> ], [ 10, 5, f10^4*f17 ], [ 11, 5, f11^4*f18 ], [ 12, 5, f12^4*f19 ],
> [ 13, 5, f6*f13^2 ], [ 14, 5, f7*f14^30 ], [ 15, 5, f8*f15*f16 ], [
> 16, 5, f9*f16 ], [ 17, 5, f10*f17^4 ], [ 18, 5, f11*f18^4 ], [ 19,
> 5, f12*f19^4 ], [ 20, 5, f20^2*f27 ], [ 21, 5, f21^30*f28 ], [ 22,
> 5, f22*f23*f29 ], [ 23, 5, f23*f30 ], [ 24, 5, f24^4*f31 ], [ 25, 5,
> f25^4*f32 ], [ 26, 5, f26^4*f33 ], [ 27, 5, f20*f27^2 ], [ 28, 5,
> f21*f28^30 ], [ 29, 5, f22*f29*f30 ], [ 30, 5, f23*f30 ], [ 31, 5,
> f24*f31^4 ], [ 32, 5, f25*f32^4 ], [ 33, 5, f26*f33^4 ], [ 34, 5,
> f34^2*f41 ], [ 35, 5, f35^30*f42 ], [ 36, 5, f36*f37*f43 ], [ 37, 5,
> f37*f44 ], [ 38, 5, f38^4*f45 ], [ 39, 5, f39^4*f46 ], [ 40, 5,
> f40^4*f47 ], [ 41, 5, f34*f41^2 ], [ 42, 5, f35*f42^30 ], [ 43, 5,
> f36*f43*f44 ], [ 44, 5, f37*f44 ], [ 45, 5, f38*f45^4 ], [ 46, 5,
> f39*f46^4 ], [ 47, 5, f40*f47^4 ], [ 48, 5, f48^2*f55 ], [ 49, 5,
> f49^30*f56 ], [ 50, 5, f50*f51*f57 ], [ 51, 5, f51*f58 ], [ 52, 5,
> f52^4*f59 ], [ 53, 5, f53^4*f60 ], [ 54, 5, f54^4*f61 ], [ 55, 5,
> f48*f55^2 ], [ 56, 5, f49*f56^30 ], [ 57, 5, f50*f57*f58 ], [ 58, 5,
> f51*f58 ], [ 59, 5, f52*f59^4 ], [ 60, 5, f53*f60^4 ], [ 61, 5,
> f54*f61^4 ], [ 7, 6, f7^4 ], [ 10, 6, f11*f12 ], [ 11, 6,
> f11^4*f12^3 ], [ 12, 6, f11^3*f12^3 ], [ 10, 7, f11^4*f12^3 ], [ 11,
> 7, f10^4*f11^4*f12^2 ], [ 12, 7, f10^2*f11^4*f12^4 ], [ 10, 8, f10
> ], [ 11, 8, f11 ], [ 12, 8, f12 ], [ 10, 9, f10^3 ], [ 11, 9, f11^3
> ], [ 12, 9, f12^3 ], [ 14, 13, f14^4 ], [ 17, 13, f18*f19 ], [ 18,
> 13, f18^4*f19^3 ], [ 19, 13, f18^3*f19^3 ], [ 17, 14, f18^4*f19^3 ],
> [ 18, 14, f17^4*f18^4*f19^2 ], [ 19, 14, f17^2*f18^4*f19^4 ], [ 17,
> 15, f17 ], [ 18, 15, f18 ], [ 19, 15, f19 ], [ 17, 16, f17^3 ], [
> 18, 16, f18^3 ], [ 19, 16, f19^3 ], [ 21, 20, f21^4 ], [ 24, 20,
> f25*f26 ], [ 25, 20, f25^4*f26^3 ], [ 26, 20, f25^3*f26^3 ], [ 24,
> 21, f25^4*f26^3 ], [ 25, 21, f24^4*f25^4*f26^2 ], [ 26, 21,
> f24^2*f25^4*f26^4 ], [ 24, 22, f24 ], [ 25, 22, f25 ], [ 26, 22, f26
> ], [ 24, 23, f24^3 ], [ 25, 23, f25^3 ], [ 26, 23, f26^3 ], [ 28,
> 27, f28^4 ], [ 31, 27, f32*f33 ], [ 32, 27, f32^4*f33^3 ], [ 33, 27,
> f32^3*f33^3 ], [ 31, 28, f32^4*f33^3 ], [ 32, 28, f31^4*f32^4*f33^2
> ], [ 33, 28, f31^2*f32^4*f33^4 ], [ 31, 29, f31 ], [ 32, 29, f32 ],
> [ 33, 29, f33 ], [ 31, 30, f31^3 ], [ 32, 30, f32^3 ], [ 33, 30,
> f33^3 ], [ 35, 34, f35^4 ], [ 38, 34, f39*f40 ], [ 39, 34,
> f39^4*f40^3 ], [ 40, 34, f39^3*f40^3 ], [ 38, 35, f39^4*f40^3 ], [
> 39, 35, f38^4*f39^4*f40^2 ], [ 40, 35, f38^2*f39^4*f40^4 ], [ 38,
> 36, f38 ], [ 39, 36, f39 ], [ 40, 36, f40 ], [ 38, 37, f38^3 ], [
> 39, 37, f39^3 ], [ 40, 37, f40^3 ], [ 42, 41, f42^4 ], [ 45, 41,
> f46*f47 ], [ 46, 41, f46^4*f47^3 ], [ 47, 41, f46^3*f47^3 ], [ 45,
> 42, f46^4*f47^3 ], [ 46, 42, f45^4*f46^4*f47^2 ], [ 47, 42,
> f45^2*f46^4*f47^4 ], [ 45, 43, f45 ], [ 46, 43, f46 ], [ 47, 43, f47
> ], [ 45, 44, f45^3 ], [ 46, 44, f46^3 ], [ 47, 44, f47^3 ], [ 49,
> 48, f49^4 ], [ 52, 48, f53*f54 ], [ 53, 48, f53^4*f54^3 ], [ 54, 48,
> f53^3*f54^3 ], [ 52, 49, f53^4*f54^3 ], [ 53, 49, f52^4*f53^4*f54^2
> ], [ 54, 49, f52^2*f53^4*f54^4 ], [ 52, 50, f52 ], [ 53, 50, f53 ],
> [ 54, 50, f54 ], [ 52, 51, f52^3 ], [ 53, 51, f53^3 ], [ 54, 51,
> f54^3 ], [ 56, 55, f56^4 ], [ 59, 55, f60*f61 ], [ 60, 55,
> f60^4*f61^3 ], [ 61, 55, f60^3*f61^3 ], [ 59, 56, f60^4*f61^3 ], [
> 60, 56, f59^4*f60^4*f61^2 ], [ 61, 56, f59^2*f60^4*f61^4 ], [ 59,
> 57, f59 ], [ 60, 57, f60 ], [ 61, 57, f61 ], [ 59, 58, f59^3 ], [
> 60, 58, f60^3 ], [ 61, 58, f61^3 ], ];;

# construct a new single collector
gap> rws := SingleCollector( g, [ 3, 7, 2, 2, 2, 3, 31, 2, 2, 5, 5, 5, 3,
>    31, 2, 2, 5, 5, 5, 3, 31, 2, 2, 5, 5, 5, 3, 31, 2, 2, 5, 5, 5, 3, 31,
>    2, 2, 5, 5, 5, 3, 31, 2, 2, 5, 5, 5, 3, 31, 2, 2, 5, 5, 5, 3, 31, 2, 2,
>    5, 5, 5 ] );
<<single collector, 16 Bits>>

# set the relators
gap> for x  in r  do
>        if 2 = Length(x)  then
>            SetPower( rws, x[1], x[2] );
>        else
>            SetCommutator( rws, x[1], x[2], x[3] );
>        fi;
>    od;

# reduce the rules and update the collector
gap> grp := GroupByRwsNC(rws);;
gap> g   := GeneratorsOfGroup(grp);;
gap> IsConfluent(grp);
true

# construct the maximal word
gap> l := [1..61]*0;;
gap> r := RelativeOrders(rws);;
gap> w := Product( List( [1..61], x -> g[x]^(r[x]-1) ) );;
gap> Print(ExtRepOfObj(w),"\n");
[ 1, 2, 2, 6, 3, 1, 4, 1, 5, 1, 6, 2, 7, 30, 8, 1, 9, 1, 10, 4, 11, 4, 12, 4, 
  13, 2, 14, 30, 15, 1, 16, 1, 17, 4, 18, 4, 19, 4, 20, 2, 21, 30, 22, 1, 23, 
  1, 24, 4, 25, 4, 26, 4, 27, 2, 28, 30, 29, 1, 30, 1, 31, 4, 32, 4, 33, 4, 
  34, 2, 35, 30, 36, 1, 37, 1, 38, 4, 39, 4, 40, 4, 41, 2, 42, 30, 43, 1, 44, 
  1, 45, 4, 46, 4, 47, 4, 48, 2, 49, 30, 50, 1, 51, 1, 52, 4, 53, 4, 54, 4, 
  55, 2, 56, 30, 57, 1, 58, 1, 59, 4, 60, 4, 61, 4 ]

# start multiplying around with <w>
gap> Print(ExtRepOfObj( w * w ),"\n");
[ 1, 1, 2, 2, 6, 1, 7, 5, 9, 1, 10, 3, 11, 3, 13, 1, 14, 5, 16, 1, 17, 3, 18, 
  3, 20, 1, 21, 5, 23, 1, 24, 3, 25, 3, 27, 1, 28, 5, 30, 1, 31, 3, 32, 3, 
  34, 1, 35, 5, 37, 1, 38, 3, 39, 3, 41, 1, 42, 5, 44, 1, 45, 3, 46, 3, 48, 
  1, 49, 5, 51, 1, 52, 3, 53, 3, 55, 1, 56, 5, 58, 1, 59, 3, 60, 3 ]

gap> Print(ExtRepOfObj( w^-1 ),"\n");
[ 1, 1, 2, 2, 3, 1, 4, 1, 5, 1, 6, 1, 7, 5, 8, 1, 10, 4, 11, 4, 12, 2, 13, 1, 
  14, 5, 15, 1, 17, 4, 18, 4, 19, 2, 20, 1, 21, 5, 22, 1, 24, 4, 25, 4, 26, 
  2, 27, 1, 28, 5, 29, 1, 31, 4, 32, 4, 33, 2, 34, 1, 35, 5, 36, 1, 38, 4, 
  39, 4, 40, 2, 41, 1, 42, 5, 43, 1, 45, 4, 46, 4, 47, 2, 48, 1, 49, 5, 50, 
  1, 52, 4, 53, 4, 54, 2, 55, 1, 56, 5, 57, 1, 59, 4, 60, 4, 61, 2 ]

gap> Print(ExtRepOfObj( w^1000 ),"\n");
[ 1, 2, 2, 6, 6, 2, 7, 30, 10, 3, 11, 3, 12, 4, 13, 2, 14, 30, 17, 3, 18, 3, 
  19, 4, 20, 2, 21, 30, 24, 3, 25, 3, 26, 4, 27, 2, 28, 30, 31, 3, 32, 3, 33, 
  4, 34, 2, 35, 30, 38, 3, 39, 3, 40, 4, 41, 2, 42, 30, 45, 3, 46, 3, 47, 4, 
  48, 2, 49, 30, 52, 3, 53, 3, 54, 4, 55, 2, 56, 30, 59, 3, 60, 3, 61, 4 ]

gap> l := GeneratorsOfGroup(grp);;
gap> p := One(grp);;
gap> for i  in l  do 
>        p := p * w * i;
>    od;
gap> Print(ExtRepOfObj(p),"\n");
[ 4, 1, 5, 1, 6, 2, 7, 5, 8, 1, 9, 1, 11, 2, 12, 2, 14, 22, 17, 3, 18, 4, 20, 
  2, 21, 4, 22, 1, 24, 1, 26, 4, 28, 26, 31, 2, 32, 3, 33, 3, 34, 2, 35, 24, 
  36, 1, 38, 1, 39, 3, 42, 30, 43, 1, 44, 1, 45, 3, 46, 3, 47, 1, 48, 2, 50, 
  1, 51, 1, 52, 3, 54, 2, 55, 1, 56, 26, 57, 1, 59, 4, 60, 2 ]

gap> l := GeneratorsOfGroup(grp);;
gap> p := One(grp);;
gap> for i  in l  do 
>        p := p * w * i * w;
>    od;
gap> Print(ExtRepOfObj(p),"\n");
[ 1, 2, 4, 1, 6, 2, 7, 3, 8, 1, 10, 1, 11, 2, 12, 3, 13, 1, 14, 21, 17, 4, 
  18, 4, 19, 1, 20, 2, 21, 30, 22, 1, 24, 2, 26, 1, 27, 1, 28, 5, 29, 1, 31, 
  4, 33, 2, 34, 2, 35, 19, 36, 1, 38, 1, 39, 2, 41, 1, 42, 5, 44, 1, 45, 3, 
  48, 2, 49, 6, 50, 1, 52, 3, 53, 1, 54, 4, 55, 2, 56, 19, 57, 1, 59, 2, 60, 
  2, 61, 1 ]

gap> Print(ExtRepOfObj( Comm( w, w ) ),"\n");
[  ]

gap> a := w * w * w;;
gap> Print(ExtRepOfObj(a),"\n");
[ 3, 1, 4, 1, 5, 1, 8, 1, 12, 1, 15, 1, 19, 1, 22, 1, 26, 1, 29, 1, 33, 1, 
  36, 1, 40, 1, 43, 1, 47, 1, 50, 1, 54, 1, 57, 1, 61, 1 ]

gap> a := a * a;;
gap> Print(ExtRepOfObj(a),"\n");
[ 9, 1, 12, 3, 16, 1, 19, 3, 23, 1, 26, 3, 30, 1, 33, 3, 37, 1, 40, 3, 44, 1, 
  47, 3, 51, 1, 54, 3, 58, 1, 61, 3 ]

gap> a := a * a;;
gap> Print(ExtRepOfObj(a),"\n");
[  ]

gap> Print(ExtRepOfObj( LeftQuotient( w*w, w ) ),"\n");
[ 1, 1, 2, 2, 3, 1, 4, 1, 5, 1, 6, 1, 7, 5, 8, 1, 10, 4, 11, 4, 12, 2, 13, 1, 
  14, 5, 15, 1, 17, 4, 18, 4, 19, 2, 20, 1, 21, 5, 22, 1, 24, 4, 25, 4, 26, 
  2, 27, 1, 28, 5, 29, 1, 31, 4, 32, 4, 33, 2, 34, 1, 35, 5, 36, 1, 38, 4, 
  39, 4, 40, 2, 41, 1, 42, 5, 43, 1, 45, 4, 46, 4, 47, 2, 48, 1, 49, 5, 50, 
  1, 52, 4, 53, 4, 54, 2, 55, 1, 56, 5, 57, 1, 59, 4, 60, 4, 61, 2 ]

gap> Print(ExtRepOfObj( w^-1 ),"\n");
[ 1, 1, 2, 2, 3, 1, 4, 1, 5, 1, 6, 1, 7, 5, 8, 1, 10, 4, 11, 4, 12, 2, 13, 1, 
  14, 5, 15, 1, 17, 4, 18, 4, 19, 2, 20, 1, 21, 5, 22, 1, 24, 4, 25, 4, 26, 
  2, 27, 1, 28, 5, 29, 1, 31, 4, 32, 4, 33, 2, 34, 1, 35, 5, 36, 1, 38, 4, 
  39, 4, 40, 2, 41, 1, 42, 5, 43, 1, 45, 4, 46, 4, 47, 2, 48, 1, 49, 5, 50, 
  1, 52, 4, 53, 4, 54, 2, 55, 1, 56, 5, 57, 1, 59, 4, 60, 4, 61, 2 ]

gap> Print(ExtRepOfObj( w^0 ),"\n");
[  ]

gap> Print(ExtRepOfObj( w^1 ),"\n");
[ 1, 2, 2, 6, 3, 1, 4, 1, 5, 1, 6, 2, 7, 30, 8, 1, 9, 1, 10, 4, 11, 4, 12, 4, 
  13, 2, 14, 30, 15, 1, 16, 1, 17, 4, 18, 4, 19, 4, 20, 2, 21, 30, 22, 1, 23, 
  1, 24, 4, 25, 4, 26, 4, 27, 2, 28, 30, 29, 1, 30, 1, 31, 4, 32, 4, 33, 4, 
  34, 2, 35, 30, 36, 1, 37, 1, 38, 4, 39, 4, 40, 4, 41, 2, 42, 30, 43, 1, 44, 
  1, 45, 4, 46, 4, 47, 4, 48, 2, 49, 30, 50, 1, 51, 1, 52, 4, 53, 4, 54, 4, 
  55, 2, 56, 30, 57, 1, 58, 1, 59, 4, 60, 4, 61, 4 ]

gap> Print(ExtRepOfObj( w^2 ),"\n");
[ 1, 1, 2, 2, 6, 1, 7, 5, 9, 1, 10, 3, 11, 3, 13, 1, 14, 5, 16, 1, 17, 3, 18, 
  3, 20, 1, 21, 5, 23, 1, 24, 3, 25, 3, 27, 1, 28, 5, 30, 1, 31, 3, 32, 3, 
  34, 1, 35, 5, 37, 1, 38, 3, 39, 3, 41, 1, 42, 5, 44, 1, 45, 3, 46, 3, 48, 
  1, 49, 5, 51, 1, 52, 3, 53, 3, 55, 1, 56, 5, 58, 1, 59, 3, 60, 3 ]

gap> Print(ExtRepOfObj( w^3 ),"\n");
[ 3, 1, 4, 1, 5, 1, 8, 1, 12, 1, 15, 1, 19, 1, 22, 1, 26, 1, 29, 1, 33, 1, 
  36, 1, 40, 1, 43, 1, 47, 1, 50, 1, 54, 1, 57, 1, 61, 1 ]

gap> Print(ExtRepOfObj( w^4 ),"\n");
[ 1, 2, 2, 6, 6, 2, 7, 30, 10, 3, 11, 3, 12, 4, 13, 2, 14, 30, 17, 3, 18, 3, 
  19, 4, 20, 2, 21, 30, 24, 3, 25, 3, 26, 4, 27, 2, 28, 30, 31, 3, 32, 3, 33, 
  4, 34, 2, 35, 30, 38, 3, 39, 3, 40, 4, 41, 2, 42, 30, 45, 3, 46, 3, 47, 4, 
  48, 2, 49, 30, 52, 3, 53, 3, 54, 4, 55, 2, 56, 30, 59, 3, 60, 3, 61, 4 ]

gap> Print(ExtRepOfObj( w^5 ),"\n");
[ 1, 1, 2, 2, 3, 1, 4, 1, 5, 1, 6, 1, 7, 5, 8, 1, 9, 1, 10, 1, 11, 1, 12, 1, 
  13, 1, 14, 5, 15, 1, 16, 1, 17, 1, 18, 1, 19, 1, 20, 1, 21, 5, 22, 1, 23, 
  1, 24, 1, 25, 1, 26, 1, 27, 1, 28, 5, 29, 1, 30, 1, 31, 1, 32, 1, 33, 1, 
  34, 1, 35, 5, 36, 1, 37, 1, 38, 1, 39, 1, 40, 1, 41, 1, 42, 5, 43, 1, 44, 
  1, 45, 1, 46, 1, 47, 1, 48, 1, 49, 5, 50, 1, 51, 1, 52, 1, 53, 1, 54, 1, 
  55, 1, 56, 5, 57, 1, 58, 1, 59, 1, 60, 1, 61, 1 ]

gap> Print(ExtRepOfObj( Comm( w, w ) ),"\n");
[  ]

gap> Print(ExtRepOfObj( Comm( w, l[1] ) ),"\n");
[ 2, 6, 3, 1, 4, 1 ]

gap> Print(ExtRepOfObj( LeftQuotient( w, w ) ) ,"\n");
[  ]

gap> Print(ExtRepOfObj( LeftQuotient( w, l[1] ) ),"\n");
[ 1, 2, 2, 4, 3, 1, 5, 1, 6, 1, 7, 5, 8, 1, 10, 4, 11, 4, 12, 2, 13, 1, 14, 
  5, 15, 1, 17, 4, 18, 4, 19, 2, 20, 1, 21, 5, 22, 1, 24, 4, 25, 4, 26, 2, 
  27, 1, 28, 5, 29, 1, 31, 4, 32, 4, 33, 2, 34, 1, 35, 5, 36, 1, 38, 4, 39, 
  4, 40, 2, 41, 1, 42, 5, 43, 1, 45, 4, 46, 4, 47, 2, 48, 1, 49, 5, 50, 1, 
  52, 4, 53, 4, 54, 2, 55, 1, 56, 5, 57, 1, 59, 4, 60, 4, 61, 2 ]

gap> Print(ExtRepOfObj( One(grp) ),"\n");
[  ]

gap> Print(ExtRepOfObj( w / w ),"\n");
[  ]

gap> Print(ExtRepOfObj( w / l[1] ),"\n");
[ 1, 1, 2, 3, 3, 1, 4, 1, 6, 2, 7, 30, 8, 1, 9, 1, 10, 4, 11, 4, 12, 4, 13, 
  2, 14, 30, 15, 1, 16, 1, 17, 4, 18, 4, 19, 4, 20, 2, 21, 30, 22, 1, 23, 1, 
  24, 4, 25, 4, 26, 4, 27, 2, 28, 30, 29, 1, 30, 1, 31, 4, 32, 4, 33, 4, 34, 
  2, 35, 30, 36, 1, 37, 1, 38, 4, 39, 4, 40, 4, 41, 2, 42, 30, 43, 1, 44, 1, 
  45, 4, 46, 4, 47, 4, 48, 2, 49, 30, 50, 1, 51, 1, 52, 4, 53, 4, 54, 4, 55, 
  2, 56, 30, 57, 1, 58, 1, 59, 4, 60, 4, 61, 4 ]


#############################################################################

# create a free group, 32 bits
gap> f := FreeGroup(IsSyllableWordsFamily,1200);;
gap> g := GeneratorsOfGroup(f){[1..61]};;

# use 'fn' as abbreviation of 'g[n]'
gap> f1 := g[1];;
gap> f2 := g[2];;
gap> f3 := g[3];;
gap> f4 := g[4];;
gap> f5 := g[5];;
gap> f6 := g[6];;
gap> f7 := g[7];;
gap> f8 := g[8];;
gap> f9 := g[9];;
gap> f10 := g[10];;
gap> f11 := g[11];;
gap> f12 := g[12];;
gap> f13 := g[13];;
gap> f14 := g[14];;
gap> f15 := g[15];;
gap> f16 := g[16];;
gap> f17 := g[17];;
gap> f18 := g[18];;
gap> f19 := g[19];;
gap> f20 := g[20];;
gap> f21 := g[21];;
gap> f22 := g[22];;
gap> f23 := g[23];;
gap> f24 := g[24];;
gap> f25 := g[25];;
gap> f26 := g[26];;
gap> f27 := g[27];;
gap> f28 := g[28];;
gap> f29 := g[29];;
gap> f30 := g[30];;
gap> f31 := g[31];;
gap> f32 := g[32];;
gap> f33 := g[33];;
gap> f34 := g[34];;
gap> f35 := g[35];;
gap> f36 := g[36];;
gap> f37 := g[37];;
gap> f38 := g[38];;
gap> f39 := g[39];;
gap> f40 := g[40];;
gap> f41 := g[41];;
gap> f42 := g[42];;
gap> f43 := g[43];;
gap> f44 := g[44];;
gap> f45 := g[45];;
gap> f46 := g[46];;
gap> f47 := g[47];;
gap> f48 := g[48];;
gap> f49 := g[49];;
gap> f50 := g[50];;
gap> f51 := g[51];;
gap> f52 := g[52];;
gap> f53 := g[53];;
gap> f54 := g[54];;
gap> f55 := g[55];;
gap> f56 := g[56];;
gap> f57 := g[57];;
gap> f58 := g[58];;
gap> f59 := g[59];;
gap> f60 := g[60];;
gap> f61 := g[61];;

# store the relators in <r>
gap> r := [

# power relators
> [ 8, f9 ], [ 15, f16 ], [ 22, f23 ], [ 29, f30 ], [ 36, f37 ], [ 43,
> f44 ], [ 50, f51 ], [ 57, f58 ],

# commutator relators
> [ 2, 1, f2 ], [ 4, 1, f5 ], [ 5, 1, f4*f5 ], [ 13, 1, f13^2*f20 ], [
> 14, 1, f14^30*f21 ], [ 15, 1, f15*f16*f22 ], [ 16, 1, f16*f23 ], [
> 17, 1, f17^4*f24 ], [ 18, 1, f18^4*f25 ], [ 19, 1, f19^4*f26 ], [
> 20, 1, f20^2*f27 ], [ 21, 1, f21^30*f28 ], [ 22, 1, f22*f23*f29 ], [
> 23, 1, f23*f30 ], [ 24, 1, f24^4*f31 ], [ 25, 1, f25^4*f32 ], [ 26,
> 1, f26^4*f33 ], [ 27, 1, f13*f27^2 ], [ 28, 1, f14*f28^30 ], [ 29,
> 1, f15*f29*f30 ], [ 30, 1, f16*f30 ], [ 31, 1, f17*f31^4 ], [ 32, 1,
> f18*f32^4 ], [ 33, 1, f19*f33^4 ], [ 41, 1, f41^2*f48 ], [ 42, 1,
> f42^30*f49 ], [ 43, 1, f43*f44*f50 ], [ 44, 1, f44*f51 ], [ 45, 1,
> f45^4*f52 ], [ 46, 1, f46^4*f53 ], [ 47, 1, f47^4*f54 ], [ 48, 1,
> f48^2*f55 ], [ 49, 1, f49^30*f56 ], [ 50, 1, f50*f51*f57 ], [ 51, 1,
> f51*f58 ], [ 52, 1, f52^4*f59 ], [ 53, 1, f53^4*f60 ], [ 54, 1,
> f54^4*f61 ], [ 55, 1, f41*f55^2 ], [ 56, 1, f42*f56^30 ], [ 57, 1,
> f43*f57*f58 ], [ 58, 1, f44*f58 ], [ 59, 1, f45*f59^4 ], [ 60, 1,
> f46*f60^4 ], [ 61, 1, f47*f61^4 ], [ 3, 2, f3*f5 ], [ 4, 2, f3*f4*f5
> ], [ 5, 2, f4*f5 ], [ 13, 2, f13^2*f20 ], [ 14, 2, f14^30*f21 ], [
> 15, 2, f15*f16*f22 ], [ 16, 2, f16*f23 ], [ 17, 2, f17^4*f24 ], [
> 18, 2, f18^4*f25 ], [ 19, 2, f19^4*f26 ], [ 20, 2, f20^2*f41 ], [
> 21, 2, f21^30*f42 ], [ 22, 2, f22*f23*f43 ], [ 23, 2, f23*f44 ], [
> 24, 2, f24^4*f45 ], [ 25, 2, f25^4*f46 ], [ 26, 2, f26^4*f47 ], [
> 27, 2, f27^2*f55 ], [ 28, 2, f28^30*f56 ], [ 29, 2, f29*f30*f57 ], [
> 30, 2, f30*f58 ], [ 31, 2, f31^4*f59 ], [ 32, 2, f32^4*f60 ], [ 33,
> 2, f33^4*f61 ], [ 34, 2, f13*f34^2 ], [ 35, 2, f14*f35^30 ], [ 36,
> 2, f15*f36*f37 ], [ 37, 2, f16*f37 ], [ 38, 2, f17*f38^4 ], [ 39, 2,
> f18*f39^4 ], [ 40, 2, f19*f40^4 ], [ 41, 2, f27*f41^2 ], [ 42, 2,
> f28*f42^30 ], [ 43, 2, f29*f43*f44 ], [ 44, 2, f30*f44 ], [ 45, 2,
> f31*f45^4 ], [ 46, 2, f32*f46^4 ], [ 47, 2, f33*f47^4 ], [ 48, 2,
> f34*f48^2 ], [ 49, 2, f35*f49^30 ], [ 50, 2, f36*f50*f51 ], [ 51, 2,
> f37*f51 ], [ 52, 2, f38*f52^4 ], [ 53, 2, f39*f53^4 ], [ 54, 2,
> f40*f54^4 ], [ 55, 2, f48*f55^2 ], [ 56, 2, f49*f56^30 ], [ 57, 2,
> f50*f57*f58 ], [ 58, 2, f51*f58 ], [ 59, 2, f52*f59^4 ], [ 60, 2,
> f53*f60^4 ], [ 61, 2, f54*f61^4 ], [ 6, 3, f6^2*f34 ], [ 7, 3,
> f7^30*f35 ], [ 8, 3, f8*f9*f36 ], [ 9, 3, f9*f37 ], [ 10, 3,
> f10^4*f38 ], [ 11, 3, f11^4*f39 ], [ 12, 3, f12^4*f40 ], [ 13, 3,
> f13^2*f41 ], [ 14, 3, f14^30*f42 ], [ 15, 3, f15*f16*f43 ], [ 16, 3,
> f16*f44 ], [ 17, 3, f17^4*f45 ], [ 18, 3, f18^4*f46 ], [ 19, 3,
> f19^4*f47 ], [ 20, 3, f20^2*f48 ], [ 21, 3, f21^30*f49 ], [ 22, 3,
> f22*f23*f50 ], [ 23, 3, f23*f51 ], [ 24, 3, f24^4*f52 ], [ 25, 3,
> f25^4*f53 ], [ 26, 3, f26^4*f54 ], [ 27, 3, f27^2*f55 ], [ 28, 3,
> f28^30*f56 ], [ 29, 3, f29*f30*f57 ], [ 30, 3, f30*f58 ], [ 31, 3,
> f31^4*f59 ], [ 32, 3, f32^4*f60 ], [ 33, 3, f33^4*f61 ], [ 34, 3,
> f6*f34^2 ], [ 35, 3, f7*f35^30 ], [ 36, 3, f8*f36*f37 ], [ 37, 3,
> f9*f37 ], [ 38, 3, f10*f38^4 ], [ 39, 3, f11*f39^4 ], [ 40, 3,
> f12*f40^4 ], [ 41, 3, f13*f41^2 ], [ 42, 3, f14*f42^30 ], [ 43, 3,
> f15*f43*f44 ], [ 44, 3, f16*f44 ], [ 45, 3, f17*f45^4 ], [ 46, 3,
> f18*f46^4 ], [ 47, 3, f19*f47^4 ], [ 48, 3, f20*f48^2 ], [ 49, 3,
> f21*f49^30 ], [ 50, 3, f22*f50*f51 ], [ 51, 3, f23*f51 ], [ 52, 3,
> f24*f52^4 ], [ 53, 3, f25*f53^4 ], [ 54, 3, f26*f54^4 ], [ 55, 3,
> f27*f55^2 ], [ 56, 3, f28*f56^30 ], [ 57, 3, f29*f57*f58 ], [ 58, 3,
> f30*f58 ], [ 59, 3, f31*f59^4 ], [ 60, 3, f32*f60^4 ], [ 61, 3,
> f33*f61^4 ], [ 6, 4, f6^2*f20 ], [ 7, 4, f7^30*f21 ], [ 8, 4,
> f8*f9*f22 ], [ 9, 4, f9*f23 ], [ 10, 4, f10^4*f24 ], [ 11, 4,
> f11^4*f25 ], [ 12, 4, f12^4*f26 ], [ 13, 4, f13^2*f27 ], [ 14, 4,
> f14^30*f28 ], [ 15, 4, f15*f16*f29 ], [ 16, 4, f16*f30 ], [ 17, 4,
> f17^4*f31 ], [ 18, 4, f18^4*f32 ], [ 19, 4, f19^4*f33 ], [ 20, 4,
> f6*f20^2 ], [ 21, 4, f7*f21^30 ], [ 22, 4, f8*f22*f23 ], [ 23, 4,
> f9*f23 ], [ 24, 4, f10*f24^4 ], [ 25, 4, f11*f25^4 ], [ 26, 4,
> f12*f26^4 ], [ 27, 4, f13*f27^2 ], [ 28, 4, f14*f28^30 ], [ 29, 4,
> f15*f29*f30 ], [ 30, 4, f16*f30 ], [ 31, 4, f17*f31^4 ], [ 32, 4,
> f18*f32^4 ], [ 33, 4, f19*f33^4 ], [ 34, 4, f34^2*f48 ], [ 35, 4,
> f35^30*f49 ], [ 36, 4, f36*f37*f50 ], [ 37, 4, f37*f51 ], [ 38, 4,
> f38^4*f52 ], [ 39, 4, f39^4*f53 ], [ 40, 4, f40^4*f54 ], [ 41, 4,
> f41^2*f55 ], [ 42, 4, f42^30*f56 ], [ 43, 4, f43*f44*f57 ], [ 44, 4,
> f44*f58 ], [ 45, 4, f45^4*f59 ], [ 46, 4, f46^4*f60 ], [ 47, 4,
> f47^4*f61 ], [ 48, 4, f34*f48^2 ], [ 49, 4, f35*f49^30 ], [ 50, 4,
> f36*f50*f51 ], [ 51, 4, f37*f51 ], [ 52, 4, f38*f52^4 ], [ 53, 4,
> f39*f53^4 ], [ 54, 4, f40*f54^4 ], [ 55, 4, f41*f55^2 ], [ 56, 4,
> f42*f56^30 ], [ 57, 4, f43*f57*f58 ], [ 58, 4, f44*f58 ], [ 59, 4,
> f45*f59^4 ], [ 60, 4, f46*f60^4 ], [ 61, 4, f47*f61^4 ], [ 6, 5,
> f6^2*f13 ], [ 7, 5, f7^30*f14 ], [ 8, 5, f8*f9*f15 ], [ 9, 5, f9*f16
> ], [ 10, 5, f10^4*f17 ], [ 11, 5, f11^4*f18 ], [ 12, 5, f12^4*f19 ],
> [ 13, 5, f6*f13^2 ], [ 14, 5, f7*f14^30 ], [ 15, 5, f8*f15*f16 ], [
> 16, 5, f9*f16 ], [ 17, 5, f10*f17^4 ], [ 18, 5, f11*f18^4 ], [ 19,
> 5, f12*f19^4 ], [ 20, 5, f20^2*f27 ], [ 21, 5, f21^30*f28 ], [ 22,
> 5, f22*f23*f29 ], [ 23, 5, f23*f30 ], [ 24, 5, f24^4*f31 ], [ 25, 5,
> f25^4*f32 ], [ 26, 5, f26^4*f33 ], [ 27, 5, f20*f27^2 ], [ 28, 5,
> f21*f28^30 ], [ 29, 5, f22*f29*f30 ], [ 30, 5, f23*f30 ], [ 31, 5,
> f24*f31^4 ], [ 32, 5, f25*f32^4 ], [ 33, 5, f26*f33^4 ], [ 34, 5,
> f34^2*f41 ], [ 35, 5, f35^30*f42 ], [ 36, 5, f36*f37*f43 ], [ 37, 5,
> f37*f44 ], [ 38, 5, f38^4*f45 ], [ 39, 5, f39^4*f46 ], [ 40, 5,
> f40^4*f47 ], [ 41, 5, f34*f41^2 ], [ 42, 5, f35*f42^30 ], [ 43, 5,
> f36*f43*f44 ], [ 44, 5, f37*f44 ], [ 45, 5, f38*f45^4 ], [ 46, 5,
> f39*f46^4 ], [ 47, 5, f40*f47^4 ], [ 48, 5, f48^2*f55 ], [ 49, 5,
> f49^30*f56 ], [ 50, 5, f50*f51*f57 ], [ 51, 5, f51*f58 ], [ 52, 5,
> f52^4*f59 ], [ 53, 5, f53^4*f60 ], [ 54, 5, f54^4*f61 ], [ 55, 5,
> f48*f55^2 ], [ 56, 5, f49*f56^30 ], [ 57, 5, f50*f57*f58 ], [ 58, 5,
> f51*f58 ], [ 59, 5, f52*f59^4 ], [ 60, 5, f53*f60^4 ], [ 61, 5,
> f54*f61^4 ], [ 7, 6, f7^4 ], [ 10, 6, f11*f12 ], [ 11, 6,
> f11^4*f12^3 ], [ 12, 6, f11^3*f12^3 ], [ 10, 7, f11^4*f12^3 ], [ 11,
> 7, f10^4*f11^4*f12^2 ], [ 12, 7, f10^2*f11^4*f12^4 ], [ 10, 8, f10
> ], [ 11, 8, f11 ], [ 12, 8, f12 ], [ 10, 9, f10^3 ], [ 11, 9, f11^3
> ], [ 12, 9, f12^3 ], [ 14, 13, f14^4 ], [ 17, 13, f18*f19 ], [ 18,
> 13, f18^4*f19^3 ], [ 19, 13, f18^3*f19^3 ], [ 17, 14, f18^4*f19^3 ],
> [ 18, 14, f17^4*f18^4*f19^2 ], [ 19, 14, f17^2*f18^4*f19^4 ], [ 17,
> 15, f17 ], [ 18, 15, f18 ], [ 19, 15, f19 ], [ 17, 16, f17^3 ], [
> 18, 16, f18^3 ], [ 19, 16, f19^3 ], [ 21, 20, f21^4 ], [ 24, 20,
> f25*f26 ], [ 25, 20, f25^4*f26^3 ], [ 26, 20, f25^3*f26^3 ], [ 24,
> 21, f25^4*f26^3 ], [ 25, 21, f24^4*f25^4*f26^2 ], [ 26, 21,
> f24^2*f25^4*f26^4 ], [ 24, 22, f24 ], [ 25, 22, f25 ], [ 26, 22, f26
> ], [ 24, 23, f24^3 ], [ 25, 23, f25^3 ], [ 26, 23, f26^3 ], [ 28,
> 27, f28^4 ], [ 31, 27, f32*f33 ], [ 32, 27, f32^4*f33^3 ], [ 33, 27,
> f32^3*f33^3 ], [ 31, 28, f32^4*f33^3 ], [ 32, 28, f31^4*f32^4*f33^2
> ], [ 33, 28, f31^2*f32^4*f33^4 ], [ 31, 29, f31 ], [ 32, 29, f32 ],
> [ 33, 29, f33 ], [ 31, 30, f31^3 ], [ 32, 30, f32^3 ], [ 33, 30,
> f33^3 ], [ 35, 34, f35^4 ], [ 38, 34, f39*f40 ], [ 39, 34,
> f39^4*f40^3 ], [ 40, 34, f39^3*f40^3 ], [ 38, 35, f39^4*f40^3 ], [
> 39, 35, f38^4*f39^4*f40^2 ], [ 40, 35, f38^2*f39^4*f40^4 ], [ 38,
> 36, f38 ], [ 39, 36, f39 ], [ 40, 36, f40 ], [ 38, 37, f38^3 ], [
> 39, 37, f39^3 ], [ 40, 37, f40^3 ], [ 42, 41, f42^4 ], [ 45, 41,
> f46*f47 ], [ 46, 41, f46^4*f47^3 ], [ 47, 41, f46^3*f47^3 ], [ 45,
> 42, f46^4*f47^3 ], [ 46, 42, f45^4*f46^4*f47^2 ], [ 47, 42,
> f45^2*f46^4*f47^4 ], [ 45, 43, f45 ], [ 46, 43, f46 ], [ 47, 43, f47
> ], [ 45, 44, f45^3 ], [ 46, 44, f46^3 ], [ 47, 44, f47^3 ], [ 49,
> 48, f49^4 ], [ 52, 48, f53*f54 ], [ 53, 48, f53^4*f54^3 ], [ 54, 48,
> f53^3*f54^3 ], [ 52, 49, f53^4*f54^3 ], [ 53, 49, f52^4*f53^4*f54^2
> ], [ 54, 49, f52^2*f53^4*f54^4 ], [ 52, 50, f52 ], [ 53, 50, f53 ],
> [ 54, 50, f54 ], [ 52, 51, f52^3 ], [ 53, 51, f53^3 ], [ 54, 51,
> f54^3 ], [ 56, 55, f56^4 ], [ 59, 55, f60*f61 ], [ 60, 55,
> f60^4*f61^3 ], [ 61, 55, f60^3*f61^3 ], [ 59, 56, f60^4*f61^3 ], [
> 60, 56, f59^4*f60^4*f61^2 ], [ 61, 56, f59^2*f60^4*f61^4 ], [ 59,
> 57, f59 ], [ 60, 57, f60 ], [ 61, 57, f61 ], [ 59, 58, f59^3 ], [
> 60, 58, f60^3 ], [ 61, 58, f61^3 ], ];;

# construct a new single collector
gap> rws := SingleCollector( g, [ 3, 7, 2, 2, 2, 3, 31, 2, 2, 5, 5, 5, 3,
>    31, 2, 2, 5, 5, 5, 3, 31, 2, 2, 5, 5, 5, 3, 31, 2, 2, 5, 5, 5, 3, 31,
>    2, 2, 5, 5, 5, 3, 31, 2, 2, 5, 5, 5, 3, 31, 2, 2, 5, 5, 5, 3, 31, 2, 2,
>    5, 5, 5 ] );
<<single collector, 32 Bits>>

# set the relators
gap> for x  in r  do
>        if 2 = Length(x)  then
>            SetPower( rws, x[1], x[2] );
>        else
>            SetCommutator( rws, x[1], x[2], x[3] );
>        fi;
>    od;

# reduce the rules and update the collector
gap> grp := GroupByRwsNC(rws);;
gap> g   := GeneratorsOfGroup(grp);;
gap> IsConfluent(grp);
true

# construct the maximal word
gap> l := [1..61]*0;;
gap> r := RelativeOrders(rws);;
gap> w := Product( List( [1..61], x -> g[x]^(r[x]-1) ) );;
gap> Print(ExtRepOfObj(w),"\n");
[ 1, 2, 2, 6, 3, 1, 4, 1, 5, 1, 6, 2, 7, 30, 8, 1, 9, 1, 10, 4, 11, 4, 12, 4, 
  13, 2, 14, 30, 15, 1, 16, 1, 17, 4, 18, 4, 19, 4, 20, 2, 21, 30, 22, 1, 23, 
  1, 24, 4, 25, 4, 26, 4, 27, 2, 28, 30, 29, 1, 30, 1, 31, 4, 32, 4, 33, 4, 
  34, 2, 35, 30, 36, 1, 37, 1, 38, 4, 39, 4, 40, 4, 41, 2, 42, 30, 43, 1, 44, 
  1, 45, 4, 46, 4, 47, 4, 48, 2, 49, 30, 50, 1, 51, 1, 52, 4, 53, 4, 54, 4, 
  55, 2, 56, 30, 57, 1, 58, 1, 59, 4, 60, 4, 61, 4 ]

# start multiplying around with <w>
gap> Print(ExtRepOfObj( w * w ),"\n");
[ 1, 1, 2, 2, 6, 1, 7, 5, 9, 1, 10, 3, 11, 3, 13, 1, 14, 5, 16, 1, 17, 3, 18, 
  3, 20, 1, 21, 5, 23, 1, 24, 3, 25, 3, 27, 1, 28, 5, 30, 1, 31, 3, 32, 3, 
  34, 1, 35, 5, 37, 1, 38, 3, 39, 3, 41, 1, 42, 5, 44, 1, 45, 3, 46, 3, 48, 
  1, 49, 5, 51, 1, 52, 3, 53, 3, 55, 1, 56, 5, 58, 1, 59, 3, 60, 3 ]

gap> Print(ExtRepOfObj( w^-1 ),"\n");
[ 1, 1, 2, 2, 3, 1, 4, 1, 5, 1, 6, 1, 7, 5, 8, 1, 10, 4, 11, 4, 12, 2, 13, 1, 
  14, 5, 15, 1, 17, 4, 18, 4, 19, 2, 20, 1, 21, 5, 22, 1, 24, 4, 25, 4, 26, 
  2, 27, 1, 28, 5, 29, 1, 31, 4, 32, 4, 33, 2, 34, 1, 35, 5, 36, 1, 38, 4, 
  39, 4, 40, 2, 41, 1, 42, 5, 43, 1, 45, 4, 46, 4, 47, 2, 48, 1, 49, 5, 50, 
  1, 52, 4, 53, 4, 54, 2, 55, 1, 56, 5, 57, 1, 59, 4, 60, 4, 61, 2 ]

gap> Print(ExtRepOfObj( w^1000 ),"\n");
[ 1, 2, 2, 6, 6, 2, 7, 30, 10, 3, 11, 3, 12, 4, 13, 2, 14, 30, 17, 3, 18, 3, 
  19, 4, 20, 2, 21, 30, 24, 3, 25, 3, 26, 4, 27, 2, 28, 30, 31, 3, 32, 3, 33, 
  4, 34, 2, 35, 30, 38, 3, 39, 3, 40, 4, 41, 2, 42, 30, 45, 3, 46, 3, 47, 4, 
  48, 2, 49, 30, 52, 3, 53, 3, 54, 4, 55, 2, 56, 30, 59, 3, 60, 3, 61, 4 ]

gap> l := GeneratorsOfGroup(grp);;
gap> p := One(grp);;
gap> for i  in l  do 
>        p := p * w * i;
>    od;
gap> Print(ExtRepOfObj(p),"\n");
[ 4, 1, 5, 1, 6, 2, 7, 5, 8, 1, 9, 1, 11, 2, 12, 2, 14, 22, 17, 3, 18, 4, 20, 
  2, 21, 4, 22, 1, 24, 1, 26, 4, 28, 26, 31, 2, 32, 3, 33, 3, 34, 2, 35, 24, 
  36, 1, 38, 1, 39, 3, 42, 30, 43, 1, 44, 1, 45, 3, 46, 3, 47, 1, 48, 2, 50, 
  1, 51, 1, 52, 3, 54, 2, 55, 1, 56, 26, 57, 1, 59, 4, 60, 2 ]

gap> l := GeneratorsOfGroup(grp);;
gap> p := One(grp);;
gap> for i  in l  do 
>        p := p * w * i * w;
>    od;
gap> Print(ExtRepOfObj(p),"\n");
[ 1, 2, 4, 1, 6, 2, 7, 3, 8, 1, 10, 1, 11, 2, 12, 3, 13, 1, 14, 21, 17, 4, 
  18, 4, 19, 1, 20, 2, 21, 30, 22, 1, 24, 2, 26, 1, 27, 1, 28, 5, 29, 1, 31, 
  4, 33, 2, 34, 2, 35, 19, 36, 1, 38, 1, 39, 2, 41, 1, 42, 5, 44, 1, 45, 3, 
  48, 2, 49, 6, 50, 1, 52, 3, 53, 1, 54, 4, 55, 2, 56, 19, 57, 1, 59, 2, 60, 
  2, 61, 1 ]

gap> Print(ExtRepOfObj( Comm( w, w ) ),"\n");
[  ]

gap> a := w * w * w;;
gap> Print(ExtRepOfObj(a),"\n");
[ 3, 1, 4, 1, 5, 1, 8, 1, 12, 1, 15, 1, 19, 1, 22, 1, 26, 1, 29, 1, 33, 1, 
  36, 1, 40, 1, 43, 1, 47, 1, 50, 1, 54, 1, 57, 1, 61, 1 ]

gap> a := a * a;;
gap> Print(ExtRepOfObj(a),"\n");
[ 9, 1, 12, 3, 16, 1, 19, 3, 23, 1, 26, 3, 30, 1, 33, 3, 37, 1, 40, 3, 44, 1, 
  47, 3, 51, 1, 54, 3, 58, 1, 61, 3 ]

gap> a := a * a;;
gap> Print(ExtRepOfObj(a),"\n");
[  ]

gap> Print(ExtRepOfObj( LeftQuotient( w*w, w ) ),"\n");
[ 1, 1, 2, 2, 3, 1, 4, 1, 5, 1, 6, 1, 7, 5, 8, 1, 10, 4, 11, 4, 12, 2, 13, 1, 
  14, 5, 15, 1, 17, 4, 18, 4, 19, 2, 20, 1, 21, 5, 22, 1, 24, 4, 25, 4, 26, 
  2, 27, 1, 28, 5, 29, 1, 31, 4, 32, 4, 33, 2, 34, 1, 35, 5, 36, 1, 38, 4, 
  39, 4, 40, 2, 41, 1, 42, 5, 43, 1, 45, 4, 46, 4, 47, 2, 48, 1, 49, 5, 50, 
  1, 52, 4, 53, 4, 54, 2, 55, 1, 56, 5, 57, 1, 59, 4, 60, 4, 61, 2 ]

gap> Print(ExtRepOfObj( w^-1 ),"\n");
[ 1, 1, 2, 2, 3, 1, 4, 1, 5, 1, 6, 1, 7, 5, 8, 1, 10, 4, 11, 4, 12, 2, 13, 1, 
  14, 5, 15, 1, 17, 4, 18, 4, 19, 2, 20, 1, 21, 5, 22, 1, 24, 4, 25, 4, 26, 
  2, 27, 1, 28, 5, 29, 1, 31, 4, 32, 4, 33, 2, 34, 1, 35, 5, 36, 1, 38, 4, 
  39, 4, 40, 2, 41, 1, 42, 5, 43, 1, 45, 4, 46, 4, 47, 2, 48, 1, 49, 5, 50, 
  1, 52, 4, 53, 4, 54, 2, 55, 1, 56, 5, 57, 1, 59, 4, 60, 4, 61, 2 ]

gap> Print(ExtRepOfObj( w^0 ),"\n");
[  ]

gap> Print(ExtRepOfObj( w^1 ),"\n");
[ 1, 2, 2, 6, 3, 1, 4, 1, 5, 1, 6, 2, 7, 30, 8, 1, 9, 1, 10, 4, 11, 4, 12, 4, 
  13, 2, 14, 30, 15, 1, 16, 1, 17, 4, 18, 4, 19, 4, 20, 2, 21, 30, 22, 1, 23, 
  1, 24, 4, 25, 4, 26, 4, 27, 2, 28, 30, 29, 1, 30, 1, 31, 4, 32, 4, 33, 4, 
  34, 2, 35, 30, 36, 1, 37, 1, 38, 4, 39, 4, 40, 4, 41, 2, 42, 30, 43, 1, 44, 
  1, 45, 4, 46, 4, 47, 4, 48, 2, 49, 30, 50, 1, 51, 1, 52, 4, 53, 4, 54, 4, 
  55, 2, 56, 30, 57, 1, 58, 1, 59, 4, 60, 4, 61, 4 ]

gap> Print(ExtRepOfObj( w^2 ),"\n");
[ 1, 1, 2, 2, 6, 1, 7, 5, 9, 1, 10, 3, 11, 3, 13, 1, 14, 5, 16, 1, 17, 3, 18, 
  3, 20, 1, 21, 5, 23, 1, 24, 3, 25, 3, 27, 1, 28, 5, 30, 1, 31, 3, 32, 3, 
  34, 1, 35, 5, 37, 1, 38, 3, 39, 3, 41, 1, 42, 5, 44, 1, 45, 3, 46, 3, 48, 
  1, 49, 5, 51, 1, 52, 3, 53, 3, 55, 1, 56, 5, 58, 1, 59, 3, 60, 3 ]

gap> Print(ExtRepOfObj( w^3 ),"\n");
[ 3, 1, 4, 1, 5, 1, 8, 1, 12, 1, 15, 1, 19, 1, 22, 1, 26, 1, 29, 1, 33, 1, 
  36, 1, 40, 1, 43, 1, 47, 1, 50, 1, 54, 1, 57, 1, 61, 1 ]

gap> Print(ExtRepOfObj( w^4 ),"\n");
[ 1, 2, 2, 6, 6, 2, 7, 30, 10, 3, 11, 3, 12, 4, 13, 2, 14, 30, 17, 3, 18, 3, 
  19, 4, 20, 2, 21, 30, 24, 3, 25, 3, 26, 4, 27, 2, 28, 30, 31, 3, 32, 3, 33, 
  4, 34, 2, 35, 30, 38, 3, 39, 3, 40, 4, 41, 2, 42, 30, 45, 3, 46, 3, 47, 4, 
  48, 2, 49, 30, 52, 3, 53, 3, 54, 4, 55, 2, 56, 30, 59, 3, 60, 3, 61, 4 ]

gap> Print(ExtRepOfObj( w^5 ),"\n");
[ 1, 1, 2, 2, 3, 1, 4, 1, 5, 1, 6, 1, 7, 5, 8, 1, 9, 1, 10, 1, 11, 1, 12, 1, 
  13, 1, 14, 5, 15, 1, 16, 1, 17, 1, 18, 1, 19, 1, 20, 1, 21, 5, 22, 1, 23, 
  1, 24, 1, 25, 1, 26, 1, 27, 1, 28, 5, 29, 1, 30, 1, 31, 1, 32, 1, 33, 1, 
  34, 1, 35, 5, 36, 1, 37, 1, 38, 1, 39, 1, 40, 1, 41, 1, 42, 5, 43, 1, 44, 
  1, 45, 1, 46, 1, 47, 1, 48, 1, 49, 5, 50, 1, 51, 1, 52, 1, 53, 1, 54, 1, 
  55, 1, 56, 5, 57, 1, 58, 1, 59, 1, 60, 1, 61, 1 ]

gap> Print(ExtRepOfObj( Comm( w, w ) ),"\n");
[  ]

gap> Print(ExtRepOfObj( Comm( w, l[1] ) ),"\n");
[ 2, 6, 3, 1, 4, 1 ]

gap> Print(ExtRepOfObj( LeftQuotient( w, w ) )  ,"\n");
[  ]

gap> Print(ExtRepOfObj( LeftQuotient( w, l[1] ) ),"\n");
[ 1, 2, 2, 4, 3, 1, 5, 1, 6, 1, 7, 5, 8, 1, 10, 4, 11, 4, 12, 2, 13, 1, 14, 
  5, 15, 1, 17, 4, 18, 4, 19, 2, 20, 1, 21, 5, 22, 1, 24, 4, 25, 4, 26, 2, 
  27, 1, 28, 5, 29, 1, 31, 4, 32, 4, 33, 2, 34, 1, 35, 5, 36, 1, 38, 4, 39, 
  4, 40, 2, 41, 1, 42, 5, 43, 1, 45, 4, 46, 4, 47, 2, 48, 1, 49, 5, 50, 1, 
  52, 4, 53, 4, 54, 2, 55, 1, 56, 5, 57, 1, 59, 4, 60, 4, 61, 2 ]

gap> Print(ExtRepOfObj( One(grp) ),"\n");
[  ]

gap> Print(ExtRepOfObj( w / w ),"\n");
[  ]

gap> Print(ExtRepOfObj( w / l[1] ),"\n");
[ 1, 1, 2, 3, 3, 1, 4, 1, 6, 2, 7, 30, 8, 1, 9, 1, 10, 4, 11, 4, 12, 4, 13, 
  2, 14, 30, 15, 1, 16, 1, 17, 4, 18, 4, 19, 4, 20, 2, 21, 30, 22, 1, 23, 1, 
  24, 4, 25, 4, 26, 4, 27, 2, 28, 30, 29, 1, 30, 1, 31, 4, 32, 4, 33, 4, 34, 
  2, 35, 30, 36, 1, 37, 1, 38, 4, 39, 4, 40, 4, 41, 2, 42, 30, 43, 1, 44, 1, 
  45, 4, 46, 4, 47, 4, 48, 2, 49, 30, 50, 1, 51, 1, 52, 4, 53, 4, 54, 4, 55, 
  2, 56, 30, 57, 1, 58, 1, 59, 4, 60, 4, 61, 4 ]


#############################################################################

gap> STOP_TEST( "rwspcgrp.tst", 239900000 );


#############################################################################
##
#E

