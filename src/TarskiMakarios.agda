open import Base.Level
open import Base.Types

-- from http://arxiv.org/abs/1306.0066

module TarskiMakarios
  { l : Level }
  { P : Set l }
  { B   : P → P → P → Set l }
  { ≅ : P → P → P → P → Set l }

  { _≡_ : P → P → Set l }
  { ≡-refl : ∀ {a b} → a ≡ b → b ≡ a }
  { ≡-cong : ∀ {a b} (prop : P → Set l) → a ≡ b → prop a → prop b }

--  ( ≅-reflexity : ∀ a b → ≅ a b b a )
  ( ≅-transitivity : ∀ {a b p q r s} → ≅ a b p q → ≅ a b r s → ≅ p q r s )
  ( ≡-from-≅ : ∀ {a b c} → ≅ a b c c → a ≡ b )
  ( seg-constr : ∀ a b c q → ∑ λ (x : P) → B q a x × ( ≅ a x b c ) )
  ( five-segs : ∀ {a b c d a' b' c' d'} → ¬ (a ≡ b) → B a b c → B a' b' c'
                → ≅ a b a' b' → ≅ b c b' c' → ≅ a d a' d' → ≅ b d b' d' → ≅ d c c' d' )
  ( ≡-from-B : ∀ {a b} → B a b a → a ≡ b )
  ( pasch : ∀ {a b c p q} → B a p c → B b q c → ∑ λ (x : P) → B p x b × B q x a )
where

l1 : ∀ a b → ≅ a b a b
l1 a b = ≅-transitivity con con
  where seg : ∑ λ (x : P) → B b a x × ( ≅ a x a b )
        seg = seg-constr _ _ _ _
        con = ∑.projr (∑.projr seg)

l2 : ∀ {a b c d} → ≅ a b c d → ≅ c d a b
l2 {a} {b} con = ≅-transitivity con (l1 a b)

l3 : ∀ a b → B a b b
l3 a b = ≡-cong (λ y → B a b y) eqv line
  where seg : ∑ λ (x : P) → B a b x × ( ≅ b x b b )
        seg = seg-constr _ _ _ _
        x : P
        x = ∑.projl seg
        eqv : x ≡ b
        eqv = ≡-refl (≡-from-≅ (∑.projr (∑.projr seg)))
        line : B a b x
        line = (∑.projl (∑.projr seg))

l4 : ∀ {a b c} → B a b c → B c b a
l4 {a} {b} {c} b0 = ≡-cong (λ y → B c y a) eq1 (∑.projr (∑.projr p1))
  where b1 : B b c c
        b1 = l3 _ _
        p1 : ∑ λ (x : P) → B b x b × B c x a
        p1 = pasch b0 b1
        x : P
        x = ∑.projl p1
        eq1 : x ≡ b
        eq1 = ≡-refl (≡-from-B (∑.projl (∑.projr p1)))

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
