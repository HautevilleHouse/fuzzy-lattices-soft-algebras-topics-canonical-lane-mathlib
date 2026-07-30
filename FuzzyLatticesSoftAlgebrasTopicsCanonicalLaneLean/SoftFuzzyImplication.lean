import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyLatticesSoftAlgebrasTopics

structure SoftFuzzyImplication (X : Type u) where
  implication : X → X → ℝ
  residuation : (X → X → ℝ) → Prop
  localSoundness : ∀ a b, (implication a b) ≥ 0
  localCompleteness : ∀ a b, (implication a b) ≤ 1

def SoftFuzzyImplicationClosed (I : SoftFuzzyImplication X) : Prop :=
  I.localSoundness ∧ I.localCompleteness

theorem soft_fuzzy_implication_closed_from_bounds (I : SoftFuzzyImplication X) (h1 : ∀ a b, I.implication a b ≥ 0) (h2 : ∀ a b, I.implication a b ≤ 1) : SoftFuzzyImplicationClosed I :=
  And.intro h1 h2

end FuzzyLatticesSoftAlgebrasTopics
end HautevilleHouse
