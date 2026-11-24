---
name: pdp-blueprint
description: Proven section-by-section structure for a high-converting product detail page (PDP), mobile first, with Shopify metafield mapping and copy slots. Use when creating, rebuilding or reviewing a product page.
---

# PDP blueprint (mobile order)

## Above the fold (no scroll on a ~390×844 phone)

1. **Gallery** - hero image (4:5), swipe + dots/thumbs, video thumbnail if any.
2. **Title** - what it is + differentiator.
3. **Rating summary** - ★ 4.8 (127 avis) → anchors to reviews. Only if real reviews exist.
4. **Price** - current price; compare-at only if genuinely sold at that price; unit/bundle price if relevant.
5. **Variant pickers** - swatches (colour) / buttons (size, age); "Taille : 4-6 ans" label; sold-out crossed out; "Guide des tailles" link → drawer.

## First swipe

6. **Quantity + Add to cart** (full width) + express checkout buttons.
7. **Delivery & returns line** - "Livraison gratuite dès 75 $ · Expédié en 1-2 jours ouvrables · Retours 30 jours".
8. **3 key benefits** - short bullets with bold lead.

## Body

9. **Description** - hook + benefits + short story.
10. **Specs table** - dimensions, weight, materials, age, care, certifications (from metafields).
11. **What's in the box.**
12. **Safety / certifications** (children's products: exact standards met, warnings, age).
13. **FAQ accordion** - 4-8 real customer questions.
14. **Reviews** - photo reviews first, filters (rating, size, age), answers from the brand.
15. **Complete the set** - 2-4 complementary products, quick add.
16. **Recently viewed / similar.**

## Sticky elements (mobile)

- Sticky add-to-cart bar appears once the main CTA leaves the viewport: thumbnail, price, selected variant, CTA.

## Metafields (namespace `custom` suggested)

| Key | Type | Used in |
|---|---|---|
| `benefits` | list.single_line_text_field | Benefits bullets |
| `specs` | json or metaobject reference | Specs table |
| `in_the_box` | list.single_line_text_field | What's in the box |
| `age_range` | single_line_text_field | Title area, specs |
| `size_chart` | metaobject reference | Size guide drawer |
| `care` | multi_line_text_field | Specs/care |
| `certifications` | list.single_line_text_field | Safety block |
| `faq` | list.metaobject_reference (question, answer) | FAQ |
| `complementary` | list.product_reference | Complete the set |

Shopify also has native "complementary products" via Search & Discovery - use it if the merchant manages them there.

## Copy slots (FR-CA example)

- Hook: one sentence, main benefit in customer words.
- Benefits: "**Lavable à la machine** - la doublure se retire en 10 secondes."
- CTA: "Ajouter au panier" → "Ajouté ✓" → "Voir le panier".
- Trust: "Retours gratuits 30 jours · Paiement sécurisé · Service à la clientèle au Québec" (only true claims).

## Checks

- [ ] Price, shipping, returns visible before scrolling past the CTA
- [ ] Every gallery image is a real photo of this product
- [ ] Structured data: Product + Offer (+ AggregateRating only if real)
- [ ] First image `fetchpriority="high"`, others lazy, all with width/height and alt text (FR/EN)
- [ ] Works with 1 variant, 20 variants, sold out, no reviews, very long title
