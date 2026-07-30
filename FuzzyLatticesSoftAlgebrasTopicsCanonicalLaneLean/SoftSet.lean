import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean

structure SoftSet (X : Type u) where
  parameterSet : X → Set ℝ
  union : X → X → X
  intersection : X → X → X
  union_assoc : ∀ a b c, union (union a b) c = union a (union b c)
  intersection_assoc : ∀ a b c, intersection (intersection a b) c = intersection a (intersection b c)
  absorption_union_intersection : ∀ a b, union a (intersection a b) = a
  absorption_intersection_union : ∀ a b, intersection a (union a b) = a
  parameter_union : ∀ a b, parameterSet (union a b) = parameterSet a ∪ parameterSet b
  parameter_intersection : ∀ a b, parameterSet (intersection a b) = parameterSet a ∩ parameterSet b

end FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean
end HautevilleHouse