import canonicalLaneMathlib.AdmissibleClass
import FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean.FuzzyLatticeProperties
import FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean.SoftAlgebraStructure

namespace HautevilleHouse
namespace FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean

structure FuzzyLatticeSoftAlgebraBridge where
  fuzzyLattice : FuzzyLatticePackage
  softAlgebra : SoftAlgebraPackage
  compatibility : ∀ a b, fuzzyLattice.join a b = softAlgebra.softOperation a b

def bridgeClosed (A : AdmissibleClass) : Prop :=
  FuzzyLatticeClosed (A.object.fuzzyLattice) ∧ SoftAlgebraClosed (A.object.softAlgebra)

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  have hFlClosed : FuzzyLatticeClosed (A.object.fuzzyLattice) := by
    exact A.property.1
  have hSaClosed : SoftAlgebraClosed (A.object.softAlgebra) := by
    exact A.property.2
  exact And.intro hFlClosed hSaClosed

end FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean
end HautevilleHouse