import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyLatticesSoftAlgebrasTopics

structure FuzzyTNorm (X : Type u) where
  tNorm : X → X → X
  commutativity : ∀ a b, tNorm a b = tNorm b a
  associativity : ∀ a b c, tNorm (tNorm a b) c = tNorm a (tNorm b c)
  monotonicity : ∀ a b c, a ≤ b → tNorm a c ≤ tNorm b c
  boundaryCondition : ∀ a, tNorm a 1 = a

def FuzzyTNormClosed (T : FuzzyTNorm X) : Prop :=
  T.commutativity ∧ T.associativity ∧ T.monotonicity ∧ T.boundaryCondition

theorem fuzzy_tnorm_closed_iff (T : FuzzyTNorm X) : FuzzyTNormClosed T ↔ (∀ a b, T.tNorm a b = T.tNorm b a) ∧ (∀ a b c, T.tNorm (T.tNorm a b) c = T.tNorm a (T.tNorm b c)) ∧ (∀ a b c, a ≤ b → T.tNorm a c ≤ T.tNorm b c) ∧ (∀ a, T.tNorm a 1 = a) :=
  ⟨λ h => h, λ h => And.intro h.1 (And.intro h.2.1 (And.intro h.2.2.1 h.2.2.2))⟩

end FuzzyLatticesSoftAlgebrasTopics
end HautevilleHouse
