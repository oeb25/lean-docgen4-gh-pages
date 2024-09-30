import Mathlib.Data.ENNReal.Basic
import Mathlib.Order.FixedPoints

namespace LeanDocgen4GhPages

theorem MyTest (f : ENNReal →o ENNReal) : OrderHom.lfp f = OrderHom.lfp f := rfl
