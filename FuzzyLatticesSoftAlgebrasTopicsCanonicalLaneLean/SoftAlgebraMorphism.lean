import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean

structure SoftAlgebraMorphism (L1 L2 : Type u) [FuzzyLatticeOrder L1] [FuzzyLatticeOrder L2] (A1 : SoftAlgebra L1) (A2 : SoftAlgebra L2) where
  baseMap : FuzzyLatticeMorphism L1 L2
  preservesSoftOps : ∀ x y : L1, baseMap.map (A1.softOperations x y) = A2.softOperations (baseMap.map x) (baseMap.map y)
  preservesSoftIdentity : baseMap.map A1.softIdentity = A2.softIdentity
  preservesSoftInverse : ∀ x : L1, baseMap.map (A1.softInverse x) = A2.softInverse (baseMap.map x)

structure SoftAlgebraMorphismEvidence (L1 L2 : Type u) [FuzzyLatticeOrder L1] [FuzzyLatticeOrder L2] (A1 : SoftAlgebra L1) (A2 : SoftAlgebra L2) (M : SoftAlgebraMorphism L1 L2 A1 A2) where
  preservesSoftOpsClosed : M.preservesSoftOps
  preservesSoftIdentityClosed : M.preservesSoftIdentity
  preservesSoftInverseClosed : M.preservesSoftInverse

def SoftAlgebraMorphismClosed (L1 L2 : Type u) [FuzzyLatticeOrder L1] [FuzzyLatticeOrder L2] (A1 : SoftAlgebra L1) (A2 : SoftAlgebra L2) (M : SoftAlgebraMorphism L1 L2 A1 A2) : Prop :=
  M.preservesSoftOps ∧ M.preservesSoftIdentity ∧ M.preservesSoftInverse

theorem soft_algebra_morphism_closed_from_evidence (L1 L2 : Type u) [FuzzyLatticeOrder L1] [FuzzyLatticeOrder L2]
    (A1 : SoftAlgebra L1) (A2 : SoftAlgebra L2) (M : SoftAlgebraMorphism L1 L2 A1 A2)
    (E : SoftAlgebraMorphismEvidence L1 L2 A1 A2 M) :
    SoftAlgebraMorphismClosed L1 L2 A1 A2 M := by
  exact And.intro E.preservesSoftOpsClosed
    (And.intro E.preservesSoftIdentityClosed E.preservesSoftInverseClosed)

end FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean
end HautevilleHouse