import canonicalLaneMathlib.AdmissibleClass
import FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean.FuzzyLatticeCore

namespace HautevilleHouse
namespace FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean

structure SoftAlgebra {L : FuzzyLattice} where
  fuzzySet : L.carrier → Type u
  membership : L.carrier → L.carrier → Prop
  inclusionReflexive : ∀ x : L.carrier, membership x x
  inclusionTransitive : ∀ x y z : L.carrier, membership x y → membership y z → membership x z
  unionClosed : ∀ x y : L.carrier, ∃ z : L.carrier, membership x z ∧ membership y z
  intersectionClosed : ∀ x y : L.carrier, ∃ z : L.carrier, membership z x ∧ membership z y

def SoftAlgebraClosed {L : FuzzyLattice} (S : SoftAlgebra L) : Prop :=
  S.inclusionReflexive ∧ S.inclusionTransitive ∧ S.unionClosed ∧ S.intersectionClosed

end FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean
end HautevilleHouse