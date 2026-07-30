import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyLatticesSoftAlgebrasTopics

structure FuzzyLattice (X : Type u) where
  carrier : Set X
  membership : X → ℝ
  membership_zero : ∀ x ∉ carrier, membership x = 0
  membership_one : ∀ x ∈ carrier, membership x = 1
  membership_in : ∀ x, membership x ∈ Set.Icc (0 : ℝ) 1

structure FuzzyLatticeHom (L M : FuzzyLattice X) where
  toFun : X → X
  preserves_membership : ∀ x, L.membership x = M.membership (toFun x)

def FuzzyLatticeClosed (L : FuzzyLattice X) : Prop :=
  ∀ x, L.membership x ∈ Set.Icc (0 : ℝ) 1

theorem fuzzy_lattice_closed_id (L : FuzzyLattice X) : FuzzyLatticeClosed L :=
  λ x => L.membership_in x

end FuzzyLatticesSoftAlgebrasTopics
end HautevilleHouse
