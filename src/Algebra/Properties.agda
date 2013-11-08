open import Prelude

module Algebra.Properties where

  bin-op : {i : Level} → Set i → Set i
  bin-op t = t → t → t

  associativity : {i : Level} {t : Set i} → bin-op t → Set i
  associativity _·_ = ∀ a b c → ((a · b) · c) ≡ (a · (b · c))

  commutativity : {i : Level} {t : Set i} → bin-op t → Set i
  commutativity _·_ = ∀ a b → a · b ≡ b · a

  identity : {i : Level} {t : Set i} → bin-op t → t → Set i
  identity _·_ e = ∀ a → (e · a ≡ a) × (a · e ≡ a)

  inverse : {i : Level} {t : Set i} → bin-op t → t → Set i
  inverse _·_ e = ∀ a b → (a · b ≡ e) × (b · a ≡ e)
