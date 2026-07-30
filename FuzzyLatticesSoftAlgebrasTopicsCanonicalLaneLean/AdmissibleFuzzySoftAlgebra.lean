import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean

structure AdmissibleFuzzySoftAlgebra (X : Type u) where
  fuzzySoftAlgebra : FuzzySoftAlgebra X
  bounded : Prop
  distributivity : Prop
  closure : Prop
  boundaryCondition : Prop

end FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean
end HautevilleHouse