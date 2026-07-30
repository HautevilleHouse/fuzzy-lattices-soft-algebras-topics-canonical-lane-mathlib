import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FuzzyLatticesSoftAlgebrasTopics.FuzzyLatticeBasics

namespace HautevilleHouse
namespace FuzzyLatticesSoftAlgebrasTopics

structure SoftAlgebra (X : Type u) where
  parameterSet : Set ℝ
  approximateFunction : ℝ → X → ℝ
  upperApproximation : ℝ → X → ℝ
  lowerApproximation : ℝ → X → ℝ
  monotonicity : ∀ ε ε', ε ≤ ε' → ∀ x, approximateFunction ε x ≤ approximateFunction ε' x

def SoftAlgebraClosed (S : SoftAlgebra X) : Prop :=
  ∀ ε ∈ S.parameterSet, ∀ x, S.upperApproximation ε x ≥ S.approximateFunction ε x ∧
    S.lowerApproximation ε x ≤ S.approximateFunction ε x

theorem soft_algebra_closed_from_properties (S : SoftAlgebra X) (h : ∀ ε ∈ S.parameterSet, ∀ x, S.upperApproximation ε x ≥ S.approximateFunction ε x ∧ S.lowerApproximation ε x ≤ S.approximateFunction ε x) : SoftAlgebraClosed S :=
  h

end FuzzyLatticesSoftAlgebrasTopics
end HautevilleHouse
