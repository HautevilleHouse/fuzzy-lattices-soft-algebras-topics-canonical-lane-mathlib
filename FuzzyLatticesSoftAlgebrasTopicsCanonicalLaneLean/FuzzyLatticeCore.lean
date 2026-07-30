import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean

structure FuzzyLattice where
  carrier : Type u
  join : carrier → carrier → carrier
  meet : carrier → carrier → carrier
  complement : carrier → carrier
  joinCommutative : ∀ a b : carrier, join a b = join b a
  meetCommutative : ∀ a b : carrier, meet a b = meet b a
  joinAssociative : ∀ a b c : carrier, join (join a b) c = join a (join b c)
  meetAssociative : ∀ a b c : carrier, meet (meet a b) c = meet a (meet b c)
  absorption : ∀ a b : carrier, meet a (join a b) = a
  complementLaw : ∀ a : carrier, join a (complement a) = meet a (complement a)

def FuzzyLatticeClosed (L : FuzzyLattice) : Prop :=
  L.joinCommutative ∧ L.meetCommutative ∧ L.joinAssociative ∧ L.meetAssociative ∧ L.absorption ∧ L.complementLaw

end FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean
end HautevilleHouse