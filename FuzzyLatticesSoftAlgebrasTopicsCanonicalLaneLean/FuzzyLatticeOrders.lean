import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean

structure FuzzyLatticeOrder (L : Type u) where
  carrier : L
  leq : L → L → Prop
  meet : L → L → L
  join : L → L → L
  fuzzyLeq : L → L → ℝ
  fuzzyMeet : L → L → ℝ
  fuzzyJoin : L → L → ℝ
  leqRefl : ∀ x : L, leq x x
  leqTrans : ∀ x y z : L, leq x y → leq y z → leq x z
  leqAntisymm : ∀ x y : L, leq x y → leq y x → x = y
  meetCommutative : ∀ x y : L, meet x y = meet y x
  meetAssociative : ∀ x y z : L, meet (meet x y) z = meet x (meet y z)
  joinCommutative : ∀ x y : L, join x y = join y x
  joinAssociative : ∀ x y z : L, join (join x y) z = join x (join y z)
  absorptionMeetJoin : ∀ x y : L, meet x (join x y) = x
  absorptionJoinMeet : ∀ x y : L, join x (meet x y) = x
  fuzzyLeqDef : ∀ x y : L, fuzzyLeq x y = if leq x y then 1 else 0
  fuzzyMeetDef : ∀ x y : L, fuzzyMeet x y = min (fuzzyLeq x y) (fuzzyLeq y x)
  fuzzyJoinDef : ∀ x y : L, fuzzyJoin x y = max (fuzzyLeq x y) (fuzzyLeq y x)

structure FuzzyLatticeEvidence (L : Type u) (F : FuzzyLatticeOrder L) where
  leqReflClosed : F.leqRefl
  leqTransClosed : F.leqTrans
  leqAntisymmClosed : F.leqAntisymm
  meetCommutativeClosed : F.meetCommutative
  meetAssociativeClosed : F.meetAssociative
  joinCommutativeClosed : F.joinCommutative
  joinAssociativeClosed : F.joinAssociative
  absorptionMeetJoinClosed : F.absorptionMeetJoin
  absorptionJoinMeetClosed : F.absorptionJoinMeet
  fuzzyLeqDefClosed : F.fuzzyLeqDef
  fuzzyMeetDefClosed : F.fuzzyMeetDef
  fuzzyJoinDefClosed : F.fuzzyJoinDef

def FuzzyLatticeOrderClosed (L : Type u) (F : FuzzyLatticeOrder L) : Prop :=
  F.leqRefl ∧ F.leqTrans ∧ F.leqAntisymm ∧
  F.meetCommutative ∧ F.meetAssociative ∧
  F.joinCommutative ∧ F.joinAssociative ∧
  F.absorptionMeetJoin ∧ F.absorptionJoinMeet ∧
  F.fuzzyLeqDef ∧ F.fuzzyMeetDef ∧ F.fuzzyJoinDef

theorem fuzzy_lattice_order_closed_from_evidence (L : Type u) (F : FuzzyLatticeOrder L)
    (E : FuzzyLatticeEvidence L F) : FuzzyLatticeOrderClosed L F := by
  exact And.intro E.leqReflClosed
    (And.intro E.leqTransClosed
      (And.intro E.leqAntisymmClosed
        (And.intro E.meetCommutativeClosed
          (And.intro E.meetAssociativeClosed
            (And.intro E.joinCommutativeClosed
              (And.intro E.joinAssociativeClosed
                (And.intro E.absorptionMeetJoinClosed
                  (And.intro E.absorptionJoinMeetClosed
                    (And.intro E.fuzzyLeqDefClosed
                      (And.intro E.fuzzyMeetDefClosed E.fuzzyJoinDefClosed))))))))))

end FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean
end HautevilleHouse