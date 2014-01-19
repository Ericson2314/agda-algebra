{-# OPTIONS --universe-polymorphism #-}

module Base.Level where

  postulate
    Level : Set
    zero : Level
    suc  : Level → Level
    _⊔_   : Level → Level → Level

  {-# BUILTIN LEVEL     Level #-}
  {-# BUILTIN LEVELZERO zero  #-}
  {-# BUILTIN LEVELSUC  suc   #-}
  {-# BUILTIN LEVELMAX  _⊔_  #-}
