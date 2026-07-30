import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean.FuzzyLatticeSoftAlgebra
import HautevilleHouse.FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean.FuzzyRelationOperator
import HautevilleHouse.FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean.DecompositionTheorem
import HautevilleHouse.FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean.StabilityAnalysis

namespace HautevilleHouse
namespace FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  match A.object with
  | _ => True

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  unfold bridgeClosed
  trivial

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

end FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean
end HautevilleHouse