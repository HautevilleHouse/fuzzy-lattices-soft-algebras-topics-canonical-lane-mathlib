import canonicalLaneMathlib.AdmissibleClass

/-!
# Soft Algebra Operations Package

This module defines soft algebra operations over fuzzy lattices.
-/

namespace HautevilleHouse
namespace FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean

structure SoftAlgebraOperationsPackage {L : FuzzyLatticePackage} where
  softUnion : L.carrier → L.carrier → L.carrier
  softIntersection : L.carrier → L.carrier → L.carrier
  softComplement : L.carrier → L.carrier
  softUnionClosed : ∀ a b : L.carrier, softUnion a b = L.join a b
  softIntersectionClosed : ∀ a b : L.carrier, softIntersection a b = L.meet a b
  complementInvolutive : ∀ a : L.carrier, softComplement (softComplement a) = a
  deMorgan : ∀ a b : L.carrier, softComplement (softUnion a b) = softIntersection (softComplement a) (softComplement b)

end FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean
end HautevilleHouse