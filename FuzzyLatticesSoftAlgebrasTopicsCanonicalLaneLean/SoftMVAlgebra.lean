import canonicalLaneMathlib.AdmissibleClass
import FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean.FuzzyLatticeCore
import FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean.SoftAlgebraStructure
import FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean.FuzzyResiduatedLattice

namespace HautevilleHouse
namespace FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean

structure SoftMVAlgebra {L : FuzzyLattice} {R : FuzzyResiduatedLattice L} where
  negation : L.carrier → L.carrier
  doubleNegation : ∀ a : L.carrier, negation (negation a) = a
  mvCondition : ∀ a b : L.carrier, join (residuum a b) (residuum b a) = top
  top : L.carrier

def SoftMVAlgebraClosed {L : FuzzyLattice} {R : FuzzyResiduatedLattice L} (M : SoftMVAlgebra R) : Prop :=
  M.doubleNegation ∧ M.mvCondition

end FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean
end HautevilleHouse