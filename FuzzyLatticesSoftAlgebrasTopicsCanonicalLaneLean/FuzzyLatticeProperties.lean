import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean

structure FuzzyLatticeProperties where
  bounded : Prop
  distributive : Prop
  complemented : Prop
  fuzzyMembershipConsistent : Prop
  
def FuzzyLatticePropertiesClosed (P : FuzzyLatticeProperties) : Prop :=
  P.bounded ∧ P.distributive ∧ P.complemented ∧ P.fuzzyMembershipConsistent

theorem fuzzy_lattice_properties_closed (P : FuzzyLatticeProperties) : FuzzyLatticePropertiesClosed P := by
  exact And.intro P.bounded (And.intro P.distributive (And.intro P.complemented P.fuzzyMembershipConsistent))

end FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean
end HautevilleHouse
