import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean

def ConstrainedFuzzySoftClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_fuzzy_soft_endgame (A : AdmissibleClass) :
    ConstrainedFuzzySoftClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean
end HautevilleHouse
