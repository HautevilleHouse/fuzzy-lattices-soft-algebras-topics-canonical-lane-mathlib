import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean

structure FuzzyLattice (α : Type u) where
  carrier : Set α
  join : α → α → α
  meet : α → α → α
  fuzzyOrder : α → α → ℝ
  joinCommutative : ∀ a b, join a b = join b a
  meetCommutative : ∀ a b, meet a b = meet b a
  joinAssociative : ∀ a b c, join (join a b) c = join a (join b c)
  meetAssociative : ∀ a b c, meet (meet a b) c = meet a (meet b c)
  absorption : ∀ a b, join a (meet a b) = a
  fuzzyOrderReflexive : ∀ a, fuzzyOrder a a = 1
  fuzzyOrderAntisymmetric : ∀ a b, fuzzyOrder a b = 1 ∧ fuzzyOrder b a = 1 → a = b
  fuzzyOrderTransitive : ∀ a b c, fuzzyOrder a b ≥ 0.5 ∧ fuzzyOrder b c ≥ 0.5 → fuzzyOrder a c ≥ 0.5

structure FuzzyLatticeEvidence (L : FuzzyLattice α) where
  carrierNonempty : Nonempty L.carrier
  operationsWellDefined : L.joinCommutative ∧ L.meetCommutative ∧ L.joinAssociative ∧ L.meetAssociative ∧ L.absorption
  fuzzyOrderAxioms : L.fuzzyOrderReflexive ∧ L.fuzzyOrderAntisymmetric ∧ L.fuzzyOrderTransitive

def FuzzyLatticeClosed (L : FuzzyLattice α) : Prop :=
  Nonempty L.carrier ∧ (L.joinCommutative ∧ L.meetCommutative ∧ L.joinAssociative ∧ L.meetAssociative ∧ L.absorption) ∧ (L.fuzzyOrderReflexive ∧ L.fuzzyOrderAntisymmetric ∧ L.fuzzyOrderTransitive)

theorem fuzzy_lattice_closed_from_evidence (L : FuzzyLattice α) (E : FuzzyLatticeEvidence L) : FuzzyLatticeClosed L := by
  exact And.intro E.carrierNonempty (And.intro E.operationsWellDefined E.fuzzyOrderAxioms)

end FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean
end HautevilleHouse