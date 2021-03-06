import ceylon.language.meta.declaration {
  TypeParameter, InterfaceDeclaration
}
import ceylon.language.meta.model {
  ClassOrInterface, Interface, InterfaceModel, ClassModel,
  MemberClass, MemberInterface, Attribute, Method, Member,
  ClosedType=Type
}

shared native class AppliedInterface<out Type>() satisfies Interface<Type>
    given Type satisfies Object {
  shared actual native String string;
  shared actual native Integer hash;
  shared actual native InterfaceDeclaration declaration;
  shared actual native ClosedType<Anything>? container;
  shared actual native Boolean equals(Object other);

  shared actual native Map<TypeParameter, ClosedType> typeArguments;
  shared actual native ClassModel<Anything, Nothing>? extendedType;
  shared actual native InterfaceModel<Anything>[] satisfiedTypes;
  shared actual native Member<SubType, Kind>? getClassOrInterface<SubType, Kind>(String name, ClosedType* types)
    given Kind satisfies ClassOrInterface<Anything>;
  shared actual native Boolean typeOf(Anything instance);
  shared actual native Boolean supertypeOf(ClosedType<Anything> type);
  shared actual native Boolean exactly(ClosedType<Anything> type);

  shared actual native MemberClass<Container, Type, Arguments>[] getClasses<Container=Nothing, Type=Anything, Arguments=Nothing>(
    ClosedType<Annotation>* annotationTypes) given Arguments satisfies Anything[];
  shared actual native MemberClass<Container, Type, Arguments>[] getDeclaredClasses<Container=Nothing, Type=Anything, Arguments=Nothing>(
    ClosedType<Annotation>* annotationTypes) given Arguments satisfies Anything[];
  shared actual native MemberClass<Container, Type, Arguments>? getClass<Container=Nothing, Type=Anything, Arguments=Nothing>(
    String name, ClosedType<Anything>* types) given Arguments satisfies Anything[];
  shared actual native MemberClass<Container, Type, Arguments>? getDeclaredClass<Container=Nothing, Type=Anything, Arguments=Nothing>(
    String name, ClosedType<Anything>* types) given Arguments satisfies Anything[];
  shared actual native MemberInterface<Container, Type>[] getInterfaces<Container=Nothing, Type=Anything>(
    ClosedType<Annotation>* annotationTypes);
  shared actual native MemberInterface<Container, Type>[] getDeclaredInterfaces<Container=Nothing, Type=Anything>(
    ClosedType<Annotation>* annotationTypes);
  shared actual native MemberInterface<Container, Type>? getInterface<Container=Nothing, Type=Anything>(
    String name, ClosedType<Anything>* types);
  shared actual native MemberInterface<Container, Type>? getDeclaredInterface<Container=Nothing, Type=Anything>(
    String name, ClosedType<Anything>* types);
  shared actual native Attribute<Container, Get, Set>[] getAttributes<Container=Nothing, Get=Anything, Set=Nothing>(
    ClosedType<Annotation>* annotationTypes);
  shared actual native Attribute<Container, Get, Set>[] getDeclaredAttributes<Container=Nothing, Get=Anything, Set=Nothing>(
    ClosedType<Annotation>* annotationTypes);
  shared actual native Attribute<Container, Get, Set>? getAttribute<Container=Nothing, Get=Anything, Set=Nothing>(String name);
  shared actual native Attribute<Container, Get, Set>? getDeclaredAttribute<Container=Nothing, Get=Anything, Set=Nothing>(String name);
  shared actual native Method<Container, Type, Arguments>[] getMethods<Container=Nothing, Type=Anything, Arguments=Nothing>(
    ClosedType<Annotation>* annotationTypes) given Arguments satisfies Anything[];
  shared actual native Method<Container, Type, Arguments>[] getDeclaredMethods<Container=Nothing, Type=Anything, Arguments=Nothing>(
    ClosedType<Annotation>* annotationTypes) given Arguments satisfies Anything[];
  shared actual native Method<Container, Type, Arguments>? getMethod<Container=Nothing, Type=Anything, Arguments=Nothing>(
    String name, ClosedType<Anything>* types) given Arguments satisfies Anything[];
  shared actual native Method<Container, Type, Arguments>? getDeclaredMethod<Container=Nothing, Type=Anything, Arguments=Nothing>(
    String name, ClosedType<Anything>* types) given Arguments satisfies Anything[];
  shared actual native Member<Container, Kind>? getDeclaredClassOrInterface<Container=Nothing, Kind=ClassOrInterface<Anything>>(
    String name, ClosedType<Anything>* types) given Kind satisfies ClassOrInterface<Anything>;
  shared actual native Type[] caseValues;

  shared actual native ClosedType<Type|Other> union<Other>(ClosedType<Other> other);
  shared actual native ClosedType<Type&Other> intersection<Other>(ClosedType<Other> other);
}
