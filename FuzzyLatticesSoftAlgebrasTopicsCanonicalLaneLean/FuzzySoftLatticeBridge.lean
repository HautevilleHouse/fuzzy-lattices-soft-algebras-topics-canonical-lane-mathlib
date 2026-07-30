import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FuzzyLatticesSoftAlgebrasTopics.FuzzyLatticeBasics
import HautevilleHouse.FuzzyLatticesSoftAlgebrasTopics.SoftAlgebra

namespace HautevilleHouse
namespace FuzzyLatticesSoftAlgebrasTopics

def bridgeClosed (A : AdmissibleClass) : Prop :=
  match A.object with
  | FuzzyLatticeObj L => FuzzyLatticeClosed L
  | SoftAlgebraObj S => SoftAlgebraClosed S
  | _ => False

theorem bridge_from_admissible_class (A : AdmissibleClass) (h : A.object.isFuzzyLattice ∨ A.object.isSoftAlgebra) : bridgeClosed A :=
by
  rcases h with (h' | h')
  · -- h' : A.object.isFuzzyLattice
    have hobj : A.object = FuzzyLatticeObj (FuzzyLattice.mk (by
      -- we need to extract the underlying type and operations from the AdmissibleClass object
      -- Since A.object is a FuzzyLattice (by h'), we can use `h'` to get the structure
      exact h'.toFuzzyLattice
    ) (by
      exact h'.toFuzzyLattice.fuzzy_ops
    ) (by
      exact h'.toFuzzyLattice.fuzzy_idem
    ) (by
      exact h'.toFuzzyLattice.fuzzy_comm
    ) (by
      exact h'.toFuzzyLattice.fuzzy_assoc
    )) := by
      -- By definition, if A.object.isFuzzyLattice, then there exists a FuzzyLattice such that A.object = FuzzyLatticeObj L
      -- We use the lemma `h'.exists_fuzzy_lattice` which is provided by the property
      -- Actually, `h'` is of type `A.object.isFuzzyLattice`, which is a proposition defined in AdmissibleClass
      -- We can use `h'.some` to get the FuzzyLattice and `h'.spec` to get the equality
      exact h'.choose_spec
    rw [hobj, bridgeClosed]
    exact fuzzy_lattice_closed_id (FuzzyLattice.mk _ _ _ _ _)
  · -- h' : A.object.isSoftAlgebra
    have hobj : A.object = SoftAlgebraObj (SoftAlgebra.mk (by
      exact h'.toSoftAlgebra
    ) (by
      exact h'.toSoftAlgebra.soft_ops
    ) (by
      exact h'.toSoftAlgebra.soft_idem
    ) (by
      exact h'.toSoftAlgebra.soft_comm
    ) (by
      exact h'.toSoftAlgebra.soft_assoc
    )) := by
      exact h'.choose_spec
    rw [hobj, bridgeClosed]
    exact soft_algebra_closed_from_properties (SoftAlgebra.mk _ _ _ _ _) (by
      intro ε hε x
      have hx : x ∈ (SoftAlgebra.mk _ _ _ _ _).carrier := by
        -- Since x is of type SoftAlgebra, we have x ∈ carrier
        trivial
      -- We need to prove (some condition) and (some condition) but the original proof used and_self_iff.mp ?_
      -- Actually we can use the property that the SoftAlgebra is closed under the operation
      exact h'.toSoftAlgebra.closed_condition ε hε x hx
    )

end FuzzyLatticesSoftAlgebrasTopics
end HautevilleHouse