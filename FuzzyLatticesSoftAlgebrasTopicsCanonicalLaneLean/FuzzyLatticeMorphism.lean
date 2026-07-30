import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean

structure FuzzyLatticeMorphism (L1 L2 : Type u) [FuzzyLatticeOrder L1] [FuzzyLatticeOrder L2] where
  map : L1 → L2
  preservesLeq : ∀ x y : L1, leq x y → leq (map x) (map y)
  preservesMeet : ∀ x y : L1, map (meet x y) = meet (map x) (map y)
  preservesJoin : ∀ x y : L1, map (join x y) = join (map x) (map y)
  preservesFuzzyLeq : ∀ x y : L1, fuzzyLeq x y = fuzzyLeq (map x) (map y)

structure FuzzyLatticeMorphismEvidence (L1 L2 : Type u) [FuzzyLatticeOrder L1] [FuzzyLatticeOrder L2] (M : FuzzyLatticeMorphism L1 L2) where
  preservesLeqClosed : M.preservesLeq
  preservesMeetClosed : M.preservesMeet
  preservesJoinClosed : M.preservesJoin
  preservesFuzzyLeqClosed : M.preservesFuzzyLeq

def FuzzyLatticeMorphismClosed (L1 L2 : Type u) [FuzzyLatticeOrder L1] [FuzzyLatticeOrder L2] (M : FuzzyLatticeMorphism L1 L2) : Prop :=
  M.preservesLeq ∧ M.preservesMeet ∧ M.preservesJoin ∧ M.preservesFuzzyLeq

theorem fuzzy_lattice_morphism_closed_from_evidence (L1 L2 : Type u) [FuzzyLatticeOrder L1] [FuzzyLatticeOrder L2]
    (M : FuzzyLatticeMorphism L1 L2) (E : FuzzyLatticeMorphismEvidence L1 L2 M) :
    FuzzyLatticeMorphismClosed L1 L2 M := by
  exact And.intro E.preservesLeqClosed
    (And.intro E.preservesMeetClosed
      (And.intro E.preservesJoinClosed E.preservesFuzzyLeqClosed))

end FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean
end HautevilleHouse