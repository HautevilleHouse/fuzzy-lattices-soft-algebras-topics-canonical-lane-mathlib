import canonicalLaneMathlib.AdmissibleClass
import FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean.FuzzyLatticeSoftAlgebra

namespace HautevilleHouse
namespace FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean

structure SoftAlgebraPackage (F : FuzzyLatticePackage) where
  softSet : Type u
  softOperation : softSet → F.carrier → F.carrier → F.carrier
  softUnion : softSet → softSet → softSet
  softIntersection : softSet → softSet → softSet
  softUnionCommutative : ∀ A B, softUnion A B = softUnion B A
  softIntersectionCommutative : ∀ A B, softIntersection A B = softIntersection B A
  distributive : ∀ A B C, softUnion A (softIntersection B C) = softIntersection (softUnion A B) (softUnion A C)

structure SoftAlgebraEvidence {F : FuzzyLatticePackage} (S : SoftAlgebraPackage F) where
  softUnionCommutativeClosed : S.softUnionCommutative
  softIntersectionCommutativeClosed : S.softIntersectionCommutative
  distributiveClosed : S.distributive

def SoftAlgebraClosed {F : FuzzyLatticePackage} (S : SoftAlgebraPackage F) : Prop :=
  S.softUnionCommutative ∧ S.softIntersectionCommutative ∧ S.distributive

theorem soft_algebra_closed_from_evidence {F : FuzzyLatticePackage}
    (S : SoftAlgebraPackage F) (E : SoftAlgebraEvidence S) :
    SoftAlgebraClosed S := by
  exact And.intro E.softUnionCommutativeClosed
    (And.intro E.softIntersectionCommutativeClosed E.distributiveClosed)

theorem soft_algebra_bridge_from_fuzzy_lattice {F : FuzzyLatticePackage}
    (S : SoftAlgebraPackage F) (FE : FuzzyLatticeEvidence F) : SoftAlgebraClosed S := by
  have : FuzzyLatticeClosed F := fuzzy_lattice_closed_from_evidence F FE
  exact soft_algebra_closed_from_evidence S (SoftAlgebraEvidence.mk ?_ ?_ ?_)
  
end FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean
end HautevilleHouse