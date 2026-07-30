import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean

structure FuzzySoftAlgebra (X : Type u) where
  fuzzyLattice : FuzzyLattice X
  softSet : SoftSet X
  compatibility_join_union : ∀ a b, fuzzyLattice.join a b = softSet.union a b
  compatibility_meet_intersection : ∀ a b, fuzzyLattice.meet a b = softSet.intersection a b

end FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean
end HautevilleHouse