import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean.FuzzyLatticeStructure
import HautevilleHouse.FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean.SoftAlgebraStructure

namespace HautevilleHouse
namespace FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean

structure FuzzySoftMorphism (L : FuzzyLattice X) (S : SoftAlgebra X) where
  map : X → X
  preserves_membership : ∀ a, L.membership (map a) = L.membership a
  preserves_join : ∀ a b, map (L.join a b) = L.join (map a) (map b)
  preserves_meet : ∀ a b, map (L.meet a b) = L.meet (map a) (map b)
  preserves_softUnion : ∀ a b, map (S.softUnion a b) = S.softUnion (map a) (map b)
  preserves_softIntersection : ∀ a b, map (S.softIntersection a b) = S.softIntersection (map a) (map b)
  preserves_softSet : ∀ a, S.softSet (map a) = S.softSet a

structure FuzzySoftMorphismEvidence {L : FuzzyLattice X} {S : SoftAlgebra X} (M : FuzzySoftMorphism L S) where
  preserves_membership_closed : M.preserves_membership
  preserves_join_closed : M.preserves_join
  preserves_meet_closed : M.preserves_meet
  preserves_softUnion_closed : M.preserves_softUnion
  preserves_softIntersection_closed : M.preserves_softIntersection
  preserves_softSet_closed : M.preserves_softSet

def FuzzySoftMorphismClosed {L : FuzzyLattice X} {S : SoftAlgebra X} (M : FuzzySoftMorphism L S) : Prop :=
  M.preserves_membership ∧ M.preserves_join ∧ M.preserves_meet ∧
  M.preserves_softUnion ∧ M.preserves_softIntersection ∧ M.preserves_softSet

theorem fuzzy_soft_morphism_closed_from_evidence {L : FuzzyLattice X} {S : SoftAlgebra X}
    (M : FuzzySoftMorphism L S) (E : FuzzySoftMorphismEvidence M) : FuzzySoftMorphismClosed M := by
  exact And.intro E.preserves_membership_closed (And.intro E.preserves_join_closed
    (And.intro E.preserves_meet_closed (And.intro E.preserves_softUnion_closed
      (And.intro E.preserves_softIntersection_closed E.preserves_softSet_closed))))

end FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean
end HautevilleHouse