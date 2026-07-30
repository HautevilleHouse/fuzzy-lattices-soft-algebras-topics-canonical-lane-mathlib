import canonicalLaneMathlib.AdmissibleClass

/-!
# Fuzzy Soft Algebra Filter Package

This module defines filters in fuzzy soft algebras.
-/

namespace HautevilleHouse
namespace FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean

structure FuzzySoftAlgebraFilter {L : FuzzyLatticePackage} {O : SoftAlgebraOperationsPackage L} where
  carrier : Set L.carrier
  topMember : L.carrier ∈ carrier
  closedUnderMeet : ∀ a b : L.carrier, a ∈ carrier → b ∈ carrier → O.softIntersection a b ∈ carrier
  upwardClosed : ∀ a b : L.carrier, a ∈ carrier → L.order a b → b ∈ carrier
  fuzzyFilterCondition : ∀ a : L.carrier, a ∈ carrier ↔ L.fuzzyMembership a a = 1.0

def FilterClosed {L : FuzzyLatticePackage} {O : SoftAlgebraOperationsPackage L}
    (F : FuzzySoftAlgebraFilter L O) : Prop :=
  F.topMember ∧ F.closedUnderMeet ∧ F.upwardClosed ∧ F.fuzzyFilterCondition

theorem filter_closed {L : FuzzyLatticePackage} {O : SoftAlgebraOperationsPackage L}
    (F : FuzzySoftAlgebraFilter L O) : FilterClosed F := by
  exact And.intro F.topMember
    (And.intro F.closedUnderMeet
      (And.intro F.upwardClosed F.fuzzyFilterCondition))

end FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean
end HautevilleHouse