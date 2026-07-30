import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean.FuzzyLatticeStructure
import HautevilleHouse.FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean.SoftAlgebraStructure

namespace HautevilleHouse
namespace FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean

structure LatticeSoftSetTopology (L : FuzzyLattice X) (S : SoftAlgebra X) where
  top : Set X
  axioms : List Prop
  fuzzy_lattice_compatible : ∀ a : X, a ∈ top → L.membership a = 1
  soft_set_compatible : ∀ a : X, a ∈ top → (∀ b : X, b ∈ S.softSet a → b ∈ top)
  closure_under_join : ∀ a b : X, a ∈ top → b ∈ top → L.join a b ∈ top
  closure_under_meet : ∀ a b : X, a ∈ top → b ∈ top → L.meet a b ∈ top
  closure_under_softUnion : ∀ a b : X, a ∈ top → b ∈ top → S.softUnion a b ∈ top
  closure_under_softIntersection : ∀ a b : X, a ∈ top → b ∈ top → S.softIntersection a b ∈ top

structure LatticeSoftSetTopologyEvidence (T : LatticeSoftSetTopology L S) where
  fuzzy_lattice_compatible_closed : T.fuzzy_lattice_compatible
  soft_set_compatible_closed : T.soft_set_compatible
  closure_under_join_closed : T.closure_under_join
  closure_under_meet_closed : T.closure_under_meet
  closure_under_softUnion_closed : T.closure_under_softUnion
  closure_under_softIntersection_closed : T.closure_under_softIntersection

def LatticeSoftSetTopologyClosed (T : LatticeSoftSetTopology L S) : Prop :=
  T.fuzzy_lattice_compatible ∧ T.soft_set_compatible ∧
  T.closure_under_join ∧ T.closure_under_meet ∧
  T.closure_under_softUnion ∧ T.closure_under_softIntersection

theorem lattice_soft_set_topology_closed_from_evidence (T : LatticeSoftSetTopology L S)
    (E : LatticeSoftSetTopologyEvidence T) : LatticeSoftSetTopologyClosed T := by
  exact And.intro E.fuzzy_lattice_compatible_closed (And.intro E.soft_set_compatible_closed
    (And.intro E.closure_under_join_closed (And.intro E.closure_under_meet_closed
      (And.intro E.closure_under_softUnion_closed E.closure_under_softIntersection_closed))))

end FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean
end HautevilleHouse