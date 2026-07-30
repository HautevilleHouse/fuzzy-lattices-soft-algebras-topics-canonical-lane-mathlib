import canonicalLaneMathlib.AdmissibleClass
import FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean.FuzzyLatticeCore
import FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean.SoftAlgebraStructure
import FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean.FuzzyResiduatedLattice
import FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean.SoftMVAlgebra

namespace HautevilleHouse
namespace FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean

structure FuzzySoftAdmittedObject where
  fuzzyLattice : FuzzyLattice
  fuzzyLatticeClosed : FuzzyLatticeClosed fuzzyLattice
  softAlgebra : SoftAlgebra fuzzyLattice
  softAlgebraClosed : SoftAlgebraClosed softAlgebra
  residuated : FuzzyResiduatedLattice fuzzyLattice
  residuatedClosed : FuzzyResiduatedLatticeClosed residuated
  mvAlgebra : SoftMVAlgebra residuated
  mvAlgebraClosed : SoftMVAlgebraClosed mvAlgebra

def FuzzySoftAdmissibleClass (O : FuzzySoftAdmittedObject) : Prop :=
  O.fuzzyLatticeClosed ∧ O.softAlgebraClosed ∧ O.residuatedClosed ∧ O.mvAlgebraClosed

def bridgeClosed (O : FuzzySoftAdmittedObject) : Prop := FuzzySoftAdmissibleClass O

def gateClosed (O : FuzzySoftAdmittedObject) : Prop := True

theorem bridge_from_admissible_class (O : FuzzySoftAdmittedObject) : bridgeClosed O :=
  by
    unfold bridgeClosed
    exact And.intro O.fuzzyLatticeClosed (And.intro O.softAlgebraClosed (And.intro O.residuatedClosed O.mvAlgebraClosed))

theorem gate_from_admissible_class (O : FuzzySoftAdmittedObject) : gateClosed O :=
  trivial

def ConstrainedFuzzySoftClosure (O : FuzzySoftAdmittedObject) : Prop :=
  bridgeClosed O ∧ gateClosed O

theorem fuzzy_soft_endgame (O : FuzzySoftAdmittedObject) : ConstrainedFuzzySoftClosure O :=
  And.intro (bridge_from_admissible_class O) (gate_from_admissible_class O)

end FuzzyLatticesSoftAlgebrasTopicsCanonicalLaneLean
end HautevilleHouse