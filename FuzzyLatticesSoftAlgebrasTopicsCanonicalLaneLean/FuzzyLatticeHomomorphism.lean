import canonicalLaneMathlib.AdmissibleClass

/-!
# Fuzzy Lattice Homomorphism Package

This module defines homomorphisms between fuzzy lattices and their closure properties.
-/

namespace HautevilleHouse
namespace FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean

structure FuzzyLatticeHomomorphism (L1 L2 : FuzzyLatticePackage) where
  map : L1.carrier → L2.carrier
  preservesJoin : ∀ a b : L1.carrier, map (L1.join a b) = L2.join (map a) (map b)
  preservesMeet : ∀ a b : L1.carrier, map (L1.meet a b) = L2.meet (map a) (map b)
  preservesOrder : ∀ a b : L1.carrier, L1.order a b → L2.order (map a) (map b)
  preservesFuzzyMembership : ∀ a b : L1.carrier,
    L1.fuzzyMembership a b = L2.fuzzyMembership (map a) (map b)

def HomomorphismClosed (L1 L2 : FuzzyLatticePackage) (H : FuzzyLatticeHomomorphism L1 L2) : Prop :=
  H.preservesJoin ∧ H.preservesMeet ∧ H.preservesOrder ∧ H.preservesFuzzyMembership

theorem homomorphism_closed (L1 L2 : FuzzyLatticePackage) (H : FuzzyLatticeHomomorphism L1 L2) :
    HomomorphismClosed L1 L2 H := by
  exact And.intro H.preservesJoin
    (And.intro H.preservesMeet
      (And.intro H.preservesOrder H.preservesFuzzyMembership))

end FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean
end HautevilleHouse