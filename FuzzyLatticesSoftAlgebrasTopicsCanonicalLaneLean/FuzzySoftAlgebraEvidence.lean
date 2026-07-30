import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean

structure FuzzySoftAlgebraEvidence (A : AdmissibleFuzzySoftAlgebra) where
  boundedClosed : A.bounded
  distributivityClosed : A.distributivity
  closureClosed : A.closure
  boundaryConditionClosed : A.boundaryCondition

def FuzzySoftAlgebraClosed (A : AdmissibleFuzzySoftAlgebra) : Prop :=
  A.bounded ∧ A.distributivity ∧ A.closure ∧ A.boundaryCondition

theorem fuzzy_soft_algebra_closed_from_evidence (A : AdmissibleFuzzySoftAlgebra) (E : FuzzySoftAlgebraEvidence A) : FuzzySoftAlgebraClosed A :=
  And.intro E.boundedClosed (And.intro E.distributivityClosed (And.intro E.closureClosed E.boundaryConditionClosed))

end FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean
end HautevilleHouse