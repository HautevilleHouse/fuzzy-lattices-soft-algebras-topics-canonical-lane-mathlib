import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean.FuzzyLatticeStructure
import HautevilleHouse.FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean.SoftAlgebraStructure

namespace HautevilleHouse
namespace FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean

structure FuzzyFilter (L : FuzzyLattice X) where
  elements : Set X
  nonempty : elements.Nonempty
  downward_closed : ∀ a b : X, a ∈ elements → L.membership b ≥ L.membership a → b ∈ elements
  upward_closed_meet : ∀ a b : X, a ∈ elements → b ∈ elements → L.meet a b ∈ elements

structure FuzzyFilterEvidence (F : FuzzyFilter L) where
  nonempty_closed : F.nonempty
  downward_closed_closed : F.downward_closed
  upward_closed_meet_closed : F.upward_closed_meet

def FuzzyFilterClosed (F : FuzzyFilter L) : Prop :=
  F.nonempty ∧ F.downward_closed ∧ F.upward_closed_meet

theorem fuzzy_filter_closed_from_evidence (F : FuzzyFilter L) (E : FuzzyFilterEvidence F) :
    FuzzyFilterClosed F := by
  exact And.intro E.nonempty_closed (And.intro E.downward_closed_closed E.upward_closed_meet_closed)

structure SoftFilter (S : SoftAlgebra X) where
  elements : Set X
  nonempty : elements.Nonempty
  downward_closed : ∀ a b : X, a ∈ elements → S.softSet a ⊆ S.softSet b → b ∈ elements
  upward_closed_intersection : ∀ a b : X, a ∈ elements → b ∈ elements → S.softIntersection a b ∈ elements

structure SoftFilterEvidence (F : SoftFilter S) where
  nonempty_closed : F.nonempty
  downward_closed_closed : F.downward_closed
  upward_closed_intersection_closed : F.upward_closed_intersection

def SoftFilterClosed (F : SoftFilter S) : Prop :=
  F.nonempty ∧ F.downward_closed ∧ F.upward_closed_intersection

theorem soft_filter_closed_from_evidence (F : SoftFilter S) (E : SoftFilterEvidence F) :
    SoftFilterClosed F := by
  exact And.intro E.nonempty_closed (And.intro E.downward_closed_closed E.upward_closed_intersection_closed)

end FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean
end HautevilleHouse