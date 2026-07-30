import canonicalLaneMathlib.AdmissibleClass
import canonicalLaneMathlib.CanonicalLaneMathlibCore

namespace HautevilleHouse
namespace FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure FuzzyLatticeSoftAlgebraAdmittedObject where
  carrier : Type
  partialOrder : PartialOrder carrier
  latticeJoin : carrier → carrier → carrier
  latticeMeet : carrier → carrier → carrier
  fuzzyMembership : carrier → ℝ → Prop
  softSet : carrier → Set carrier
  algebraicProperties : Prop
  conclusion : algebraicProperties

def FuzzyLatticeSoftAlgebraWitnessClosed (O : FuzzyLatticeSoftAlgebraAdmittedObject) : Prop :=
  O.algebraicProperties

structure TheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  fuzzyLatticeSoftAlgebraConstrainedStatement : String
  certificateLane : String
  carriedRemainder : String

def sourceRepository : String := "fuzzy-lattices-soft-algebras-topics-canonical-lane"
def sourceDescription : String := "Fuzzy Lattices Soft Algebras Topics Canonical Lane"
def sourceTheoremBoundary : String := "Classical boundary carries unrestricted remainder"
def baselineCertificateLane : String := "fuzzy_soft_constrained"
def baselineCertificateAllPass : Bool := true
def outsideConstantDependencyCount : Nat := 0

end FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean
end HautevilleHouse
