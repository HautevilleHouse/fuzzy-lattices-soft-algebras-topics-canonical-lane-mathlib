import canonicalLaneMathlib.AdmissibleClass

/-!
# Fuzzy Soft Algebra Closure Package

This module defines the closure structure for fuzzy soft algebras.
-/

namespace HautevilleHouse
namespace FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean

structure FuzzySoftAlgebraClosurePackage {L : FuzzyLatticePackage} {O : SoftAlgebraOperationsPackage L} where
  closureOperator : L.carrier → L.carrier
  monotone : ∀ a b : L.carrier, L.order a b → L.order (closureOperator a) (closureOperator b)
  extensive : ∀ a : L.carrier, L.order a (closureOperator a)
  idempotent : ∀ a : L.carrier, closureOperator (closureOperator a) = closureOperator a
  fixedPointsClosedUnderSoftOps : ∀ a b : L.carrier, closureOperator a = a → closureOperator b = b →
    closureOperator (O.softUnion a b) = O.softUnion a b ∧
    closureOperator (O.softIntersection a b) = O.softIntersection a b

def ClosureClosed {L : FuzzyLatticePackage} {O : SoftAlgebraOperationsPackage L}
    (C : FuzzySoftAlgebraClosurePackage L O) : Prop :=
  C.monotone ∧ C.extensive ∧ C.idempotent

theorem closure_closed {L : FuzzyLatticePackage} {O : SoftAlgebraOperationsPackage L}
    (C : FuzzySoftAlgebraClosurePackage L O) : ClosureClosed C := by
  exact And.intro C.monotone (And.intro C.extensive C.idempotent)

end FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean
end HautevilleHouse