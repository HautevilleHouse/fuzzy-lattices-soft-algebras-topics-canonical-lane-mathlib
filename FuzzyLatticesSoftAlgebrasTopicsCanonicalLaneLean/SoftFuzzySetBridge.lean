import canonicalLaneMathlib.AdmissibleClass

/-!
# Soft Fuzzy Set Bridge Package

This module bridges fuzzy sets and soft algebras through admissible class structure.
-/

namespace HautevilleHouse
namespace FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean

structure FuzzySetSoftAlgebraBridge {L : FuzzyLatticePackage} {O : SoftAlgebraOperationsPackage L}
    (C : FuzzySoftAlgebraClosurePackage L O) where
  fuzzySetCarrier : Type u
  membershipDegree : fuzzySetCarrier → L.carrier
  softMembership : fuzzySetCarrier → L.carrier → ℝ
  bridgeCondition : ∀ x : fuzzySetCarrier, softMembership x (C.closureOperator (membershipDegree x)) = 1.0
  closurePreservesMembership : ∀ x : fuzzySetCarrier,
    C.closureOperator (membershipDegree x) = membershipDegree x

def BridgeClosed {L : FuzzyLatticePackage} {O : SoftAlgebraOperationsPackage L}
    {C : FuzzySoftAlgebraClosurePackage L O} (B : FuzzySetSoftAlgebraBridge C) : Prop :=
  B.bridgeCondition ∧ B.closurePreservesMembership

theorem bridge_closed {L : FuzzyLatticePackage} {O : SoftAlgebraOperationsPackage L}
    {C : FuzzySoftAlgebraClosurePackage L O} (B : FuzzySetSoftAlgebraBridge C) : BridgeClosed B := by
  exact And.intro B.bridgeCondition B.closurePreservesMembership

end FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean
end HautevilleHouse