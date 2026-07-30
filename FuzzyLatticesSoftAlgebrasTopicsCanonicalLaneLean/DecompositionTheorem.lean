import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean.FuzzyLatticeSoftAlgebra
import HautevilleHouse.FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean.FuzzyRelationOperator

namespace HautevilleHouse
namespace FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean

structure DecompositionPackage {F : FuzzyLattice U} {S : SoftAlgebra F}
    (P : FuzzyOperatorPackage F S) where
  decomposition_exists : Prop
  decomposition_property : Prop
  decomposition_exists_term : decomposition_exists
  decomposition_property_term : decomposition_property

structure DecompositionEvidence {F : FuzzyLattice U} {S : SoftAlgebra F}
    {P : FuzzyOperatorPackage F S} (D : DecompositionPackage P) where
  decomposition_exists_closed : D.decomposition_exists
  decomposition_property_closed : D.decomposition_property

def DecompositionClosed {F : FuzzyLattice U} {S : SoftAlgebra F}
    {P : FuzzyOperatorPackage F S} (D : DecompositionPackage P) : Prop :=
  D.decomposition_exists ∧ D.decomposition_property

theorem decomposition_closed_from_evidence {F : FuzzyLattice U} {S : SoftAlgebra F}
    {P : FuzzyOperatorPackage F S} (D : DecompositionPackage P)
    (E : DecompositionEvidence D) : DecompositionClosed D := by
  exact And.intro E.decomposition_exists_closed E.decomposition_property_closed

end FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean
end HautevilleHouse