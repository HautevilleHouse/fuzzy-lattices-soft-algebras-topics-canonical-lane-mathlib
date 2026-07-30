import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean.FuzzyLatticeSoftAlgebra
import HautevilleHouse.FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean.FuzzyRelationOperator

namespace HautevilleHouse
namespace FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean

structure StabilityPackage {F : FuzzyLattice U} {S : SoftAlgebra F}
    (P : FuzzyOperatorPackage F S) where
  fixed_points : Set (U → ℝ)
  stability_condition : Prop
  perturbation_bounds : Prop
  fixed_points_closed : fixed_points ≠ ∅
  stability_condition_term : stability_condition
  perturbation_bounds_term : perturbation_bounds

structure StabilityEvidence {F : FuzzyLattice U} {S : SoftAlgebra F}
    {P : FuzzyOperatorPackage F S} (Stab : StabilityPackage P) where
  stability_condition_closed : Stab.stability_condition
  perturbation_bounds_closed : Stab.perturbation_bounds

def StabilityClosed {F : FuzzyLattice U} {S : SoftAlgebra F}
    {P : FuzzyOperatorPackage F S} (Stab : StabilityPackage P) : Prop :=
  Stab.stability_condition ∧ Stab.perturbation_bounds

theorem stability_closed_from_evidence {F : FuzzyLattice U} {S : SoftAlgebra F}
    {P : FuzzyOperatorPackage F S} (Stab : StabilityPackage P)
    (E : StabilityEvidence Stab) : StabilityClosed Stab := by
  exact And.intro E.stability_condition_closed E.perturbation_bounds_closed

end FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean
end HautevilleHouse