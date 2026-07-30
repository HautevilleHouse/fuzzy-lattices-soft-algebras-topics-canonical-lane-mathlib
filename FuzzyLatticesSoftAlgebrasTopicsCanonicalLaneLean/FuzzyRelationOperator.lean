import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean.FuzzyLatticeSoftAlgebra

namespace HautevilleHouse
namespace FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean

structure FuzzyRelation (F : FuzzyLattice U) (S : SoftAlgebra F) where
  source : U → ℝ
  target : U → ℝ
  membership_condition : ∀ x : U, membership x ≤ source x ∧ membership x ≤ target x

structure FuzzyOperator (F : FuzzyLattice U) (S : SoftAlgebra F) (R : FuzzyRelation F S) where
  domain : Set (U → ℝ)
  codomain : Set (U → ℝ)
  evaluation : (U → ℝ) → (U → ℝ)
  linearity : ∀ f g : U → ℝ, evaluation (addition f g) = addition (evaluation f) (evaluation g)
  boundedness : ∃ M : ℝ, ∀ f : U → ℝ, max (membership (evaluation f)) ≤ M * max (membership f)

structure FuzzyOperatorPackage (F : FuzzyLattice U) (S : SoftAlgebra F) where
  relation : FuzzyRelation F S
  operator : FuzzyOperator F S relation
  composition_closed : Prop
  composition_closed_term : composition_closed

def FuzzyOperatorClosed {F : FuzzyLattice U} {S : SoftAlgebra F} (P : FuzzyOperatorPackage F S) : Prop :=
  P.composition_closed

end FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean
end HautevilleHouse