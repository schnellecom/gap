#############################################################################
##
#W  ideal.gd                    GAP library                     Thomas Breuer
##
#H  @(#)$Id$
##                                                     
#Y  Copyright (C)  1997,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
#Y  (C) 1998 School Math and Comp. Sci., University of St.  Andrews, Scotland
#Y  Copyright (C) 2002 The GAP Group
##
##  This file declares the operations for ideals.
#1
##  A *left ideal* in a ring $R$ is a subring of $R$
##  that is closed under multiplication with elements of $R$ from the left.
##
##  A *right ideal* in a ring $R$ is a subring of $R$
##  that is closed under multiplication with elements of $R$ from the right.
##
##  A *two-sided ideal* or simply *ideal* in a ring $R$ is both a left ideal
##  and a right ideal in $R$.
##
##  So being a (left/right/two-sided) ideal is not a property of a domain
##  but refers to the acting ring(s).
##  Hence we must ask, e.~g., `IsIdeal( <R>, <I> )' if we want to know
##  whether the ring <I> is an ideal in the ring <R>.
##  The property `IsIdealInParent' can be used to store whether a ring is an
##  ideal in its parent.
##
##  (Whenever the term `Ideal' occurs without specifying prefix `Left' or
##  `Right', this means the same as `TwoSidedIdeal'. Conversely, any 
##  occurrence of `TwoSidedIdeal' can be substituted by `Ideal'.)
##
##  For any of the above kinds of ideals, there is a notion of generators,
##  namely `GeneratorsOfLeftIdeal', `GeneratorsOfRightIdeal', and
##  `GeneratorsOfTwoSidedIdeal'.
##  The acting rings can be accessed as `LeftActingRingOfIdeal' and
##  `RightActingRingOfIdeal', respectively.
##  Note that ideals are detected from known values of these attributes,
##  especially it is assumed that whenever a domain has both a left and a
##  right acting ring then these two are equal.
##
##  Note that we cannot use `LeftActingDomain' and `RightActingDomain' here,
##  since ideals in algebras are themselves vector spaces, and such a space
##  can of course also be a module for an action from the right.
##  In order to make the usual vector space functionality automatically
##  available for ideals, we have to distinguish the left and right module
##  structure from the additional closure properties of the ideal.
##
##  Further note that the attributes denoting ideal generators and acting
##  ring are used to create ideals if this is explicitly wanted, but the
##  ideal relation in the sense of `IsIdeal' is of course independent of the
##  presence of the attribute values.
##
##  Ideals are constructed with `LeftIdeal', `RightIdeal', `TwoSidedIdeal'.
##  Principal ideals of the form $x * R$, $R * x$, $R * x * R$ can also be
##  constructed with a simple multiplication.
##
##  Currently many methods for dealing with ideals need linear algebra to
##  work, so they are mainly applicable to ideals in algebras.
##
#W  The sum of two left/right/two-sided ideals with same acting ring can be
#W  formed, it is again an ideal.
#W  The product of two ideals ...
##
Revision.ideal_gd :=
    "@(#)$Id$";                 


#############################################################################
##
#F  TwoSidedIdeal( <R>, <gens>[, "basis"] )
#F  Ideal( <R>, <gens>[, "basis"] )
#F  LeftIdeal( <R>, <gens>[, "basis"] )  . . left ideal in <R> gen. by <gens>
#F  RightIdeal( <R>, <gens>[, "basis"] ) .  right ideal in <R> gen. by <gens>
##
##  Let <R> be a ring, and <gens> a list of collection of elements in <R>.
##  `TwoSidedIdeal', `LeftIdeal', and `RightIdeal' return the two-sided,
##  left, or right ideal, respectively, $I$ in <R> that is generated by
##  <gens>.
##  The ring <R> can be accessed as `LeftActingRingOfIdeal' or
##  `RightActingRingOfIdeal'
##  (or both) of $I$.
##
##  If <R> is a left $F$-module then also $I$ is a left $F$-module,
##  in particular the `LeftActingDomain' (see~"LeftActingDomain") values of
##  <R> and $I$ are equal.
##
##  If the optional argument `\"basis\"' is given then <gens> are assumed to
##  be a list of basis vectors of $I$ viewed as a free $F$-module.
##  (This is mainly applicable to ideals in algebras.)
##  In this case, it is *not* checked whether <gens> really is linearly
##  independent and whether <gens> is a subset of <R>.
##
##  `Ideal' is simply a synonym of `TwoSidedIdeal'.
##
DeclareGlobalFunction( "TwoSidedIdeal" );
DeclareSynonym( "Ideal", TwoSidedIdeal );
DeclareGlobalFunction( "LeftIdeal" );
DeclareGlobalFunction( "RightIdeal" );


#############################################################################
##
#F  TwoSidedIdealNC( <R>, <gens>[, "basis"] )
#F  IdealNC( <R>, <gens>[, "basis"] )
#F  LeftIdealNC( <R>, <gens>[, "basis"] )
#F  RightIdealNC( <R>, <gens>[, "basis"] )
##
##  The effects of `TwoSidedIdealNC', `LeftIdealNC', and `RightIdealNC' are
##  the same as `TwoSidedIdeal', `LeftIdeal', and `RightIdeal', respectively
##  (see~"TwoSidedIdeal"), but they do not check whether all entries
##  of <gens> lie in <R>.
##
DeclareGlobalFunction( "TwoSidedIdealNC" );
DeclareSynonym( "IdealNC", TwoSidedIdealNC );
DeclareGlobalFunction( "LeftIdealNC" );
DeclareGlobalFunction( "RightIdealNC" );


#############################################################################
##
#O  IsTwoSidedIdeal( <R>, <I> )
#O  IsLeftIdeal( <R>, <I> )
#O  IsRightIdeal( <R>, <I> )
#P  IsTwoSidedIdealInParent( <I> )
#P  IsLeftIdealInParent( <I> )
#P  IsRightIdealInParent( <I> )
##
##  The properties `IsTwoSidedIdealInParent' etc., are attributes of the
##  ideal, and once known they are stored in the ideal. 
##
InParentFOA( "IsTwoSidedIdeal", IsRing, IsRing, DeclareProperty );
InParentFOA( "IsLeftIdeal", IsRing, IsRing, DeclareProperty );
InParentFOA( "IsRightIdeal", IsRing, IsRing, DeclareProperty );

DeclareSynonym( "IsIdeal", IsTwoSidedIdeal );
DeclareSynonym( "IsIdealOp", IsTwoSidedIdealOp );
DeclareSynonymAttr( "IsIdealInParent", IsTwoSidedIdealInParent );

InstallTrueMethod( IsLeftIdealInParent, IsTwoSidedIdealInParent );
InstallTrueMethod( IsRightIdealInParent, IsTwoSidedIdealInParent );
InstallTrueMethod( IsTwoSidedIdealInParent,
    IsLeftIdealInParent and IsRightIdealInParent );


#############################################################################
##
#O  TwoSidedIdealByGenerators( <R>, <gens> )  . . ideal in <R> gen. by <gens>
#O  IdealByGenerators( <R>, <gens> )
##
##  `TwoSidedIdealByGenerators' returns the ring that is generated by the
##  elements of the collection <gens> under addition, multiplication, and
##  multiplication with elements of the ring <R> from the left and from the
##  right.
##
##  <R> can be accessed by `LeftActingRingOfIdeal' or
##  `RightActingRingOfIdeal',
##  <gens> can be accessed by `GeneratorsOfTwoSidedIdeal'.
##
DeclareOperation( "TwoSidedIdealByGenerators", [ IsRing, IsCollection ] );

DeclareSynonym( "IdealByGenerators", TwoSidedIdealByGenerators );


#############################################################################
##
#O  LeftIdealByGenerators( <R>, <gens> )
##
##  `LeftIdealByGenerators' returns the ring that is generated by the
##  elements of the collection <gens> under addition, multiplication, and
##  multiplication with elements of the ring <R> from the left.
##
##  <R> can be accessed by `LeftActingRingOfIdeal',
##  <gens> can be accessed by `GeneratorsOfLeftIdeal'.
##
DeclareOperation( "LeftIdealByGenerators", [ IsRing, IsCollection ] );


#############################################################################
##
#O  RightIdealByGenerators( <R>, <gens> )
##
##  `RightIdealByGenerators' returns the ring that is generated by the
##  elements of the collection <gens> under addition, multiplication, and
##  multiplication with elements of the ring <R> from the right.
##
##  <R> can be accessed by `RightActingRingOfIdeal',
##  <gens> can be accessed by `GeneratorsOfRightIdeal'.
##
DeclareOperation( "RightIdealByGenerators", [ IsRing, IsCollection ] );


#############################################################################
##
#A  GeneratorsOfTwoSidedIdeal( <I> )
#A  GeneratorsOfIdeal( <I> )
##
##  is a list of generators for the bi-ideal <I>, with respect to the action of
##  `LeftActingRingOfIdeal( <I> )' from the left and the action of
##  `RightActingRingOfIdeal( <I> )'from the right.
##
##  Note that `LeftActingRingOfIdeal(<I>)' and `RightActingRingOfIdeal(<I>)'
##  coincide if <I> is a two-sided ideal.
##
DeclareAttribute( "GeneratorsOfTwoSidedIdeal", IsRing );

DeclareSynonymAttr( "GeneratorsOfIdeal", GeneratorsOfTwoSidedIdeal );


#############################################################################
##
#A  GeneratorsOfLeftIdeal( <I> )
##
##  is a list of generators for the left ideal <I>, with respect to the 
##  action of
##  `LeftActingRingOfIdeal( <I> )' from the left.
##
DeclareAttribute( "GeneratorsOfLeftIdeal", IsRing );


#############################################################################
##
#A  GeneratorsOfRightIdeal( <I> )
##
##  is a list of generators for the right ideal <I>, with respect to the 
##  action of
##  `RightActingRingOfIdeal( <I> )' from the right.
##
DeclareAttribute( "GeneratorsOfRightIdeal", IsRing );


#############################################################################
##
#A  LeftActingRingOfIdeal( <I> )
#A  RightActingRingOfIdeal( <I> )
##
DeclareAttribute( "LeftActingRingOfIdeal", IsRing );

DeclareAttribute( "RightActingRingOfIdeal", IsRing );


#############################################################################
##
#O  AsLeftIdeal( <R>, <S> )
#O  AsRightIdeal( <R>, <S> )
#O  AsTwoSidedIdeal( <R>, <S> )
##
##  Let <S> be a subring of <R>.
##
##  If <S> is a left ideal in <R> then `AsLeftIdeal' returns this left ideal,
##  otherwise `fail' is returned.
##  If <S> is a right ideal in <R> then `AsRightIdeal' returns this right
##  ideal, otherwise `fail' is returned.
##  If <S> is a two-sided ideal in <R> then `AsTwoSidedIdeal' returns this
##  two-sided ideal, otherwise `fail' is returned.
##
DeclareOperation( "AsLeftIdeal", [ IsRing, IsRing ] );
DeclareOperation( "AsRightIdeal", [ IsRing, IsRing ] );
DeclareOperation( "AsTwoSidedIdeal", [ IsRing, IsRing ] );


#############################################################################
##
#E

