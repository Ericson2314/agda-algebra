open import Base.Level
open import Base.Types

-- from http://arxiv.org/abs/1306.0066

module TarskiMakarios
  { l : Level }
  { P : Set l }
  { B   : P → P → P → Set l }
  { ≅ : P → P → P → P → Set l }

  { _≡_ : P → P → Set l }

--  ( ≅-reflexity : ∀ a b → ≅ a b b a )
  ( ≅-transitivity : ∀ {a b p q r s} → ≅ a b p q → ≅ a b r s → ≅ p q r s )
  ( ≡-from-≅ : ∀ {a b c} → ≅ a b c c → a ≡ b )
  ( seg-constr : ∀ a b c q → ∑ λ (x : P) → B q a b × ( ≅ a x b c ) )
  ( five-segs : ∀ {a b c d a' b' c' d'} → ¬ (a ≡ b) → B a b c → B a' b' c'
                → ≅ a b a' b' → ≅ b c b' c' → ≅ a d a' d' → ≅ b d b' d' → ≅ d c c' d' )
  ( ≡-from-B : ∀ {a b} → B a b a → a ≡ b )
  ( pasch : ∀ {a b c p q} → B a p c → B b q c → ∑ λ (x : P) → B p x b → B q x a )
where

  l1 : ∀ a b → ≅ a b a b
  l1 a b = ≅-transitivity con con
    where tri : ∑ λ (x : P) → B b a a × ( ≅ a x a b )
          tri = seg-constr a a b b
          con = ∑.projr (∑.projr tri)

  module Euclidian
    ( euclidian : ∀ a b c d t → B a d t → B b d c → ¬ (a ≡ d)
                  → ∑ λ (x : P) → ∑ λ (y : P) → B a b x + (B a c y + B x t y) )
    where

  module Continuity
    ( continuity : (φ ψ : P → Set l) → (∑ λ (b : P) → ∀ x y → φ x → ψ y → B x b y)
                   → (∑ λ (b : P) → ∀ x y → φ x → ψ y → B x b y) )
    where

  module 2D
    ( lower-2d : ∀ a b c → (¬ (B a b c)) × ((¬ (B b c a)) × (¬ (B c a b))) )
    ( lower-2d : ∀ a b c p q → ¬ (p ≡ q) → ≅ a p a q → ≅ b p b q → ≅ c p c q
                 → B a b c + (B b c a + B c a b) )
    where
