import canonicalLaneMathlib.AdmissibleClass
import FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean.FuzzyLatticeCore
import FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean.SoftAlgebraStructure

namespace HautevilleHouse
namespace FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean

structure FuzzyResiduatedLattice {L : FuzzyLattice} where
  tensor : L.carrier → L.carrier → L.carrier
  residuum : L.carrier → L.carrier → L.carrier
  tensorMonotone : ∀ a b c : L.carrier, meet a b = a → meet (tensor a c) (tensor b c) = tensor a c
  residuumAdjunction : ∀ a b c : L.carrier, membership (tensor a b) c ↔ membership a (residuum b c)

def FuzzyResiduatedLatticeClosed {L : FuzzyLattice} (R : FuzzyResiduatedLattice L) : Prop :=
  R.tensorMonotone ∧ R.residuumAdjunction

end FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean
end HautevilleHouse