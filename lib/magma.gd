#############################################################################
##
#W  magma.gd                    GAP library                     Thomas Breuer
##
#H  @(#)$Id$
##
#Y  Copyright (C)  1997,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
#Y  (C) 1998 School Math and Comp. Sci., University of St.  Andrews, Scotland
#Y  Copyright (C) 2002 The GAP Group
##
##  This  file   declares   the categories   of  magmas,   their  properties,
##  attributes, and operations.  Note that the  meaning of generators for the
##  three categories  magma,   magma-with-one, and    magma-with-inverses  is
##  different.
##
Revision.magma_gd:=
    "@(#)$Id$";


#############################################################################
##
#C  IsMagma( <obj> )  . . . . . . . . . . . test whether an object is a magma
##
##  A *magma* in {\GAP} is a domain $M$ with (not necessarily associative)
##  multiplication `\*'$: M \times M \rightarrow M$.
##
DeclareCategory( "IsMagma", IsDomain and IsMultiplicativeElementCollection );


#############################################################################
##
#C  IsMagmaWithOne( <obj> ) . . .  test whether an object is a magma-with-one
##
##  A *magma-with-one* in {\GAP} is a magma $M$ with an operation `^0'
##  (or `One') that yields the identity of $M$.
##
##  So a magma-with-one <M> does always contain a unique multiplicatively
##  neutral element <e>, i.e., `<e> \* <m> = <m> = <m> \* <e>' holds for all 
##  `<m> $\in$ <M>'
##  (see~"MultiplicativeNeutralElement").
##  This element <e> can be computed with the operation `One' (see~"One")
##  as `One( <M> )', and <e> is also equal to `One( <elm> )' and to
##  `<elm>^0' for each element <elm> in <M>.
##
##  *Note* that a magma may contain a multiplicatively neutral element
##  but *not* an identity (see~"One"),
##  and a magma containing an identity may *not* lie in the category
##  `IsMagmaWithOne' (see~"Domain Categories").
##
DeclareCategory( "IsMagmaWithOne",
    IsMagma and IsMultiplicativeElementWithOneCollection );


#############################################################################
##
#C  IsMagmaWithInversesIfNonzero( <obj> )
##
##  An object in this {\GAP} category is a magma-with-one $M$
##  with an operation
##  `^-1'$: M\setminus Z \rightarrow M \setminus Z$
##  that maps each element <m> of $M\setminus Z$ to its inverse `<m>^-1'
##  (or `Inverse( <m> )', see~"Inverse"),
##  where $Z$ is either empty or consists exactly of one element of $M$.
##
##  This category was introduced mainly to describe division rings,
##  since the nonzero elements in a division ring form a group;
##  So an object $M$ in `IsMagmaWithInversesIfNonzero' will usually have both
##  a multiplicative and an additive structure (see~"Additive Magmas"),
##  and the set $Z$, if it is nonempty, contains exactly the zero element
##  (see~"Zero") of $M$.
##
DeclareCategory( "IsMagmaWithInversesIfNonzero",
    IsMagmaWithOne and IsMultiplicativeElementWithOneCollection );


#############################################################################
##
#C  IsMagmaWithInverses( <obj> )
##
##  A *magma-with-inverses* in {\GAP} is a magma-with-one $M$ with an
##  operation `^-1'$: M \rightarrow M$ that maps each element <m> of $M$ to
##  its inverse `<m>^-1' (or `Inverse( <m> )', see~"Inverse").
##
##  Note that not every trivial magma is a magma-with-one,
##  but every trivial magma-with-one is a magma-with-inverses.
##  This holds also if the identity of the magma-with-one is a zero element.
##  So a magma-with-inverses-if-nonzero can be a magma-with-inverses
##  if either it contains no zero element or consists of a zero element that
##  has itself as zero-th power.
##
DeclareCategory( "IsMagmaWithInverses",
        IsMagmaWithInversesIfNonzero
    and IsMultiplicativeElementWithInverseCollection );

InstallTrueMethod( IsMagmaWithInverses,
    IsFiniteOrderElementCollection and IsMagma );

InstallTrueMethod( IsMagmaWithInverses, IsMagmaWithOne and IsTrivial );


#############################################################################
##
#a  One( <D> )
##
##  (see the description in `arith.gd')
##
DeclareAttribute( "One",
    IsDomain and IsMultiplicativeElementWithOneCollection );


#############################################################################
##
#F  Magma( <gens> )
#F  Magma( <Fam>, <gens> )
##
##  returns the magma $M$ that is generated by the elements
##  in the list <gens>, that is,
##  the closure of <gens> under multiplication `\*'.
##  The family <Fam> of $M$ can be entered as first argument;
##  this is obligatory if <gens> is empty (and hence also $M$ is empty).
##
DeclareGlobalFunction( "Magma" );


#############################################################################
##
#F  MagmaWithOne( <gens> )
#F  MagmaWithOne( <Fam>, <gens> )
##
##  returns the magma-with-one $M$ that is generated by the elements
##  in the list <gens>, that is,
##  the closure of <gens> under multiplication `\*' and `One'.
##  The family <Fam> of $M$ can be entered as first argument;
##  this is obligatory if <gens> is empty (and hence $M$ is trivial).
##
DeclareGlobalFunction( "MagmaWithOne" );


#############################################################################
##
#F  MagmaWithInverses( <gens> )
#F  MagmaWithInverses( <Fam>, <gens> )
##
##  returns the magma-with-inverses $M$ that is generated by the elements
##  in the list <gens>, that is,
##  the closure of <gens> under multiplication `\*', `One', and `Inverse'.
##  The family <Fam> of $M$ can be entered as first argument;
##  this is obligatory if <gens> is empty (and hence $M$ is trivial).
##
DeclareGlobalFunction( "MagmaWithInverses" );


#############################################################################
##
#O  MagmaByGenerators( <gens> )
#O  MagmaByGenerators( <Fam>, <gens> )
##
DeclareOperation( "MagmaByGenerators", [ IsCollection ] );


#############################################################################
##
#O  MagmaWithOneByGenerators( <gens> )
#O  MagmaWithOneByGenerators( <Fam>, <generators> )
##
DeclareOperation( "MagmaWithOneByGenerators", [ IsCollection ] );


#############################################################################
##
#O  MagmaWithInversesByGenerators( <generators> )
#O  MagmaWithInversesByGenerators( <Fam>, <generators> )
##
DeclareOperation( "MagmaWithInversesByGenerators", [ IsCollection ] );


#############################################################################
##
#F  Submagma( <D>, <gens> )
#F  SubmagmaNC( <D>, <gens> )
##
##  `Submagma' returns the magma generated by
##  the elements in the list <gens>, with parent the domain <D>.
##  `SubmagmaNC' does the same, except that it is not checked
##  whether the elements of <gens> lie in <D>.
##
DeclareGlobalFunction( "Submagma" );

DeclareGlobalFunction( "SubmagmaNC" );


#############################################################################
##
#F  SubmagmaWithOne( <D>, <gens> )
#F  SubmagmaWithOneNC( <D>, <gens> )
##
##  `SubmagmaWithOne' returns the magma-with-one generated by
##  the elements in the list <gens>, with parent the domain <D>.
##  `SubmagmaWithOneNC' does the same, except that it is not checked
##  whether the elements of <gens> lie in <D>.
##
DeclareGlobalFunction( "SubmagmaWithOne" );

DeclareGlobalFunction( "SubmagmaWithOneNC" );


#############################################################################
##
#F  SubmagmaWithInverses( <D>, <gens> )
#F  SubmagmaWithInversesNC( <D>, <gens> )
##
##  `SubmagmaWithInverses' returns the magma-with-inverses generated by
##  the elements in the list <gens>, with parent the domain <D>.
##  `SubmagmaWithInversesNC' does the same, except that it is not checked
##  whether the elements of <gens> lie in <D>.
##
DeclareGlobalFunction( "SubmagmaWithInverses" );

DeclareGlobalFunction( "SubmagmaWithInversesNC" );


#############################################################################
##
#A  AsMagma( <C> )  . . . . . . . . . . . . . .  view a collection as a magma
##
##  For a collection <C> whose elements form a magma,
##  `AsMagma' returns this magma.
##  Otherwise `fail' is returned.
##
DeclareAttribute( "AsMagma", IsCollection );


#############################################################################
##
#O  AsSubmagma( <D>, <C> )  . . . view a collection as a submagma of a domain
##
##  Let <D> be a domain and <C> a collection.
##  If <C> is a subset of <D> that forms a magma then `AsSubmagma' returns
##  this magma, with parent <D>.
##  Otherwise `fail' is returned.
##
DeclareOperation( "AsSubmagma", [ IsDomain, IsCollection ] );


#############################################################################
##
#A  GeneratorsOfMagma( <M> )
##
##  is a list <gens> of elements of the magma <M> that generates <M> as a
##  magma, that is, the closure of <gens> under multiplication is <M>.
##
DeclareAttribute( "GeneratorsOfMagma", IsMagma );


#############################################################################
##
#A  GeneratorsOfMagmaWithOne( <M> )
##
##  is a list <gens> of elements of the magma-with-one <M> that generates <M>
##  as a magma-with-one,
##  that is, the closure of <gens> under multiplication and `One' (see~"One")
##  is <M>.
##
DeclareAttribute( "GeneratorsOfMagmaWithOne", IsMagmaWithOne );


#############################################################################
##
#A  GeneratorsOfMagmaWithInverses( <M> )
##
##  is a list <gens> of elements of the magma-with-inverses <M>
##  that generates <M> as a magma-with-inverses,
##  that is, the closure of <gens> under multiplication and taking inverses
##  (see~"Inverse") is <M>.
##
DeclareAttribute( "GeneratorsOfMagmaWithInverses", IsMagmaWithInverses );


#############################################################################
##
#P  IsGeneratorsOfMagmaWithInverses( <gens> )
##
##  `IsGeneratorsOfMagmaWithInverses' returns `true' if the elements in the
##  list or collection <gens> generate a magma with inverses,
##  and `false' otherwise.
##
DeclareProperty( "IsGeneratorsOfMagmaWithInverses", IsListOrCollection );


#############################################################################
##
#A  TrivialSubmagmaWithOne( <M> ) . . . . . . . . . . .  for a magma-with-one
##
##  is the magma-with-one that has the identity of the magma-with-one <M>
##  as only element.
##
DeclareAttribute( "TrivialSubmagmaWithOne", IsMagmaWithOne );


#############################################################################
##
#P  IsAssociative( <M> )  . . . . . . . . test whether a magma is associative
##
##  A magma <M> is *associative* if for all elements `<a>, <b>, <c> $\in$ <M>'
##  the equality `(<a> \* <b>) \* <c> = <a> \* (<b> \* <c>)' holds.
##
##  An associative magma is called a *semigroup* (see~"Semigroups"),
##  an associative magma-with-one is called a *monoid* (see~"Monoids"),
##  and an associative magma-with-inverses is called a *group*
##  (see~"Groups").
##
DeclareProperty( "IsAssociative", IsMagma );

InstallTrueMethod( IsAssociative,
    IsAssociativeElementCollection and IsMagma );

InstallSubsetMaintenance( IsAssociative,
    IsMagma and IsAssociative, IsMagma );

InstallFactorMaintenance( IsAssociative,
    IsMagma and IsAssociative, IsObject, IsMagma );

InstallTrueMethod( IsAssociative, IsMagma and IsTrivial );


#############################################################################
##
#P  IsCommutative( <M> )  . . . . . . . . test whether a magma is commutative
#P  IsAbelian( <M> )
##
##  A magma <M> is *commutative* if for all elements `<a>, <b> $\in$ <M>' the
##  equality `<a> \* <b> = <b> \* <a>' holds.
##  `IsAbelian' is a synonym of `IsCommutative'.
##
##  Note that the commutativity of the *addition* `+' in an additive
##  structure can be tested with `IsAdditivelyCommutative',
##  see~"IsAdditivelyCommutative".
##
DeclareProperty( "IsCommutative", IsMagma );

DeclareSynonymAttr( "IsAbelian", IsCommutative );

InstallTrueMethod( IsCommutative,
    IsCommutativeElementCollection and IsMagma );

InstallSubsetMaintenance( IsCommutative,
    IsMagma and IsCommutative, IsMagma );

InstallFactorMaintenance( IsCommutative,
    IsMagma and IsCommutative, IsObject, IsMagma );

InstallTrueMethod( IsCommutative, IsMagma and IsTrivial );


#############################################################################
##
#A  MultiplicativeNeutralElement( <M> )
##
##  returns the element <e> in the magma <M> with the property that
##  `<e> \* <m> = <m> = <m> \* <e>' holds for all `<m> $\in$ <M>',
##  if such an element exists.
##  Otherwise `fail' is returned.
##
##  A magma that is not a magma-with-one can have a multiplicative neutral
##  element $e$; in this case, $e$ *cannot* be obtained as `One( <M> )',
##  see~"One".
##
DeclareAttribute( "MultiplicativeNeutralElement", IsMagma );


#############################################################################
##
#A  Centre( <M> ) . . . . . . . . . . . . . . . . . . . . . centre of a magma
#A  Center( <M> ) . . . . . . . . . . . . . . . . . . . . . centre of a magma
##
##  `Centre' returns the *centre* of the magma <M>, i.e., the domain
##  of those elements `<m> $\in$ <M>' that commute and associate with all
##  elements of <M>. That is, the set $\{m\in M;\forall a,b\in M: ma=am,
##  (ma)b=m(ab), (am)b=a(mb), (ab)m=a(bm)\}$.
##
##  `Center' is just a synonym for `Centre'.
##
##  For associative magmas we have that 
##  `Centre( <M> ) = Centralizer( <M>, <M> )', see~"Centralizer".
##
##  The centre of a magma is always commutative (see~"IsCommutative").
##  (When one installs a new method for `Centre', one should set the
##  `IsCommutative' value of the result to `true',
##  in order to make this information available.)
##
DeclareAttribute( "Centre", IsMagma );

DeclareSynonymAttr( "Center", Centre );


#############################################################################
##
#A  Idempotents( <M> )
##
##  The set of elements of <M> which are their own squares.
##
DeclareAttribute( "Idempotents", IsMagma );


#############################################################################
##
#O  IsCentral( <M>, <obj> ) . .  test whether an object is central in a magma
##
##  `IsCentral' returns `true' if the object <obj>, which must either be an
##  element or a magma, commutes with all elements in the magma <M>.
##
DeclareOperation( "IsCentral", [ IsMagma, IsObject ] );


#############################################################################
##
#O  Centralizer( <M>, <elm> )
#O  Centralizer( <M>, <S> )
#O  Centralizer( <class> )
##
##  For an element <elm> of the magma <M> this operation returns the 
##  *centralizer* of <elm>.
##  This is the domain of those elements `<m> $\in$ <M>' that commute 
##  with <elm>.
##
##  For a submagma <S> it returns the domain of those elements that commute
##  with *all* elements <s> of <S>.
##
##  If <class> is a class of objects of a magma (this magma then is stored
##  as the `ActingDomain' of <class>)
##  such as given by `ConjugacyClass' (see~"ConjugacyClass"),
##  `Centralizer' returns the centralizer of
##  `Representative(<class>)' (which is a slight abuse of the notation).
#T do we really want this?
#T (we may be interested in using the *attribute* also for conjugacy classes,
#T but also the *function*?)
##
InParentFOA( "Centralizer", IsMagma, IsObject, DeclareAttribute );


#############################################################################
##
#O  SquareRoots( <M>, <elm> )
##
##  is the proper set of all elements <r> in the magma <M>
##  such that `<r> \* <r> = <elm>' holds.
##
DeclareOperation( "SquareRoots", [ IsMagma, IsMultiplicativeElement ] );


#############################################################################
##
#F  FreeMagma( <rank> )
#F  FreeMagma( <rank>, <name> )
#F  FreeMagma( <name1>, <name2>, ... )
#F  FreeMagma( <names> )
#F  FreeMagma( infinity, <name>, <init> )
##
##  Called in the first form, `FreeMagma' returns a free magma on          
##  <rank> generators.
##  Called in the second form, `FreeMagma' returns a free magma on         
##  <rank> generators, printed as `<name>1', `<name>2' etc.,
##  that is, each name is the concatenation of the string <name> and an
##  integer from `1' to <range>.
##  Called in the third form, `FreeMagma' returns a free magma on
##  as many generators as arguments, printed as <name1>, <name2> etc.
##  Called in the fourth form, `FreeMagma' returns a free magma on
##  as many generators as the length of the list <names>, the $i$-th         
##  generator being printed as `<names>[$i$]'.
##  Called in the fifth form, `FreeMagma' returns a free magma on          
##  infinitely many generators, where the first generators are printed
##  by the names in the list <init>, and the other generators by <name>
##  and an appended number.
##
DeclareGlobalFunction( "FreeMagma" );


#############################################################################
##
#F  FreeMagmaWithOne( <rank> )
#F  FreeMagmaWithOne( <rank>, <name> )
#F  FreeMagmaWithOne( <name1>, <name2>, ... )
#F  FreeMagmaWithOne( <names> )
#F  FreeMagmaWithOne( infinity, <name>, <init> )
##
##  Called in the first form, `FreeMagmaWithOne' returns
##  a free magma-with-one on <rank> generators.
##  Called in the second form, `FreeMagmaWithOne' returns
##  a free magma-with-one on <rank> generators,
##  printed as `<name>1', `<name>2' etc.
##  Called in the third form, `FreeMagmaWithOne' returns
##  a free magma-with-one on as many generators as arguments,
##  printed as <name1>, <name2> etc.
##  Called in the fourth form, `FreeMagmaWithOne' returns
##  a free magma-with-one on as many generators as the length of the list
##  <names>, the $i$-th generator being printed as `<names>[$i$]'.
##  Called in the fifth form, `FreeMagmaWithOne' returns
##  a free magma on infinitely many generators,
##  where the first generators are printed by the names in the list <init>,
##  and the other generators by <name> and an appended number.
##
DeclareGlobalFunction( "FreeMagmaWithOne" );


#############################################################################
##
#F  IsCommutativeFromGenerators( <GeneratorsOfStruct> )
##
##  is a function that takes one domain argument <D> and checks whether
##  `<GeneratorsOfStruct>( <D> )' commute.
##
BindGlobal( "IsCommutativeFromGenerators", function( GeneratorsStruct )
    return function( D )

    local gens,   # list of generators
          i, j;   # loop variables

    # Test if every element commutes with all the others.
    gens:= GeneratorsStruct( D );
    for i in [ 2 .. Length( gens ) ] do
      for j in [ 1 .. i-1 ] do
        if gens[i] * gens[j] <> gens[j] * gens[i] then
          return false;
        fi;
      od;
    od;

    # All generators commute.
    return true;
    end;
end );


#############################################################################
##
#F  IsCentralFromGenerators( <GeneratorsStruct1>, <GeneratorsStruct2> )
##
##  is a function that takes two domain arguments <D1>, <D2> and checks
##  whether `<GeneratorsStruct1>( <D1> )' and `<GeneratorsStruct2>( <D2> )'
##  commute.
##
BindGlobal( "IsCentralFromGenerators",
    function( GeneratorsStruct1, GeneratorsStruct2 )
    return function( D1, D2 )
    local g1, g2;
    for g1 in GeneratorsStruct1( D1 ) do
      for g2 in GeneratorsStruct2( D2 ) do
        if g1 * g2 <> g2 * g1 then
          return false;
        fi;
      od;
    od;
    return true;
    end;
end );


#############################################################################
##
#A  MagmaGeneratorsOfFamily( <Fam> )
##
##  For a family <Fam> of words in a free magma, free magma-with-one,
##  free semigroup, free monoid, or free group,
##  `MagmaGeneratorsOfFamily' returns a list of magma generators for the
##  free object that contains each element in <Fam>.
##
DeclareAttribute( "MagmaGeneratorsOfFamily", IsFamily );


#############################################################################
##
#E

