import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean

structure FuzzyLattice (X : Type u) where
  membership : X → ℝ
  join : X → X → X
  meet : X → X → X
  join_comm : ∀ a b, join a b = join b a
  meet_comm : ∀ a b, meet a b = meet b a
  join_assoc : ∀ a b c, join (join a b) c = join a (join b c)
  meet_assoc : ∀ a b c, meet (meet a b) c = meet a (meet b c)
  absorption_join_meet : ∀ a b, join a (meet a b) = a
  absorption_meet_join : ∀ a b, meet a (join a b) = a
  membership_join : ∀ a b, membership (join a b) = max (membership a) (membership b)
  membership_meet : ∀ a b, membership (meet a b) = min (membership a) (membership b)

end FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean
end HautevilleHouse