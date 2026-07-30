import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean

structure FuzzySoftRepresentation (L : Type u) [FuzzyLatticeOrder L] (A : SoftAlgebra L) (X : Type u) where
  representationMap : L → (X → ℝ)
  respectsFuzzyLeq : ∀ x y : L, fuzzyLeq x y = (∀ z : X, representationMap x z ≤ representationMap y z)
  respectsSoftOps : ∀ x y : L, representationMap (A.softOperations x y) = (fun z : X => max (representationMap x z) (representationMap y z))
  respectsSoftIdentity : ∀ z : X, representationMap A.softIdentity z = 1
  respectsSoftInverse : ∀ x : L, representationMap (A.softInverse x) = (fun z : X => 1 - representationMap x z)

structure FuzzySoftRepresentationEvidence (L : Type u) [FuzzyLatticeOrder L] (A : SoftAlgebra L) (X : Type u) (R : FuzzySoftRepresentation L A X) where
  respectsFuzzyLeqClosed : R.respectsFuzzyLeq
  respectsSoftOpsClosed : R.respectsSoftOps
  respectsSoftIdentityClosed : R.respectsSoftIdentity
  respectsSoftInverseClosed : R.respectsSoftInverse

def FuzzySoftRepresentationClosed (L : Type u) [FuzzyLatticeOrder L] (A : SoftAlgebra L) (X : Type u) (R : FuzzySoftRepresentation L A X) : Prop :=
  R.respectsFuzzyLeq ∧ R.respectsSoftOps ∧ R.respectsSoftIdentity ∧ R.respectsSoftInverse

theorem fuzzy_soft_representation_closed_from_evidence (L : Type u) [FuzzyLatticeOrder L] (A : SoftAlgebra L) (X : Type u)
    (R : FuzzySoftRepresentation L A X) (E : FuzzySoftRepresentationEvidence L A X R) :
    FuzzySoftRepresentationClosed L A X R := by
  exact And.intro E.respectsFuzzyLeqClosed
    (And.intro E.respectsSoftOpsClosed
      (And.intro E.respectsSoftIdentityClosed E.respectsSoftInverseClosed))

end FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean
end HautevilleHouse