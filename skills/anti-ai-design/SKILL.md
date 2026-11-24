---
name: anti-ai-design
description: Checklist and rules to make any UI, landing page or storefront look crafted by a real design studio instead of AI-generated or template-made. Use when designing, generating or reviewing any interface, especially before shipping generated UI. Covers banned patterns, replacements, type/colour/layout recipes and a scoring rubric.
---

# Anti-AI design

Goal: interfaces that look intentional and specific. Not plainer - more specific.

## Step 1 - Write the art direction first

Before any layout, write 5 lines:
1. What is sold, to whom, at what price level.
2. Three adjectives for the brand (not "modern", "clean" or "sleek" - too generic).
3. Three real-world references (brands, magazines, places, objects) and what you take from each.
4. The dominant colour and the display typeface.
5. Three things this design will NOT do.

## Step 2 - Banned defaults → replacements

| AI/template default | Replace with |
|---|---|
| Purple→blue or pink→violet gradient | One committed flat brand colour in large fields |
| Gradient text on headline | Solid ink; contrast through size and weight |
| Blurry aurora blobs behind hero | Real photograph, full bleed, or plain paper colour |
| Centered hero: pill badge → headline → subline → 2 buttons | Left-aligned or asymmetric composition with product imagery as the hero |
| 3 identical feature cards with icon in rounded square | A list with numbers, a table, or one big image + short text; vary each section's form |
| Glassmorphism, heavy shadows, 24px radius everywhere | Flat surfaces, hairline rules, one radius 0-8px |
| Fade-up animation on every scroll | Motion only for state changes, drawers, image load |
| Inter/Poppins/Montserrat at defaults | Characterful display face + quiet text face, tuned tracking |
| Title Case Everywhere, emoji in headings | Sentence case, no emoji in UI |
| Stock 3D shapes, isometric illustrations | Real photos of the product, people, place, packaging |
| AI-generated people/products | Real photography (see shot list in product-photo-art-director) |
| Every section same width & padding | Rhythm: vary heights, widths, density; full bleed next to narrow text |
| Fake testimonials "Sarah J. ⭐⭐⭐⭐⭐" | Real reviews with names/initials, dates, photos, verified badge |
| "Elevate / Unlock / Seamless / Plongez dans" | Plain, specific sentences with facts |

## Step 3 - Recipes

**Type**
- Pair: one display (editorial serif, expressive grotesk, or variable font with personality) + one text face. Max 2 families.
- Display sizes very large on desktop (clamp e.g. `clamp(2.5rem, 6vw, 6rem)`), line-height 1.0-1.1, tracking slightly negative (-0.01 to -0.03em).
- Body 16-18px, line-height 1.5-1.6, max ~65ch.
- Create contrast with scale jumps (tiny label next to huge headline), not with colours.
- Prefer fonts not used on every site; check licence for web use. Good free sources: Google Fonts, Fontshare, Velvetyne, Collletttivo.

**Colour**
- Paper: warm off-white (e.g. `#F6F3EE`), not pure white everywhere. Ink: deep near-black (e.g. `#141414` or a very dark brand hue), not pure black.
- One brand colour used boldly (backgrounds of whole sections), one accent at most.
- Check text contrast ≥ 4.5:1 (≥ 3:1 for ≥ 24px text).

**Layout**
- 12-column grid desktop, 4 mobile. Break it on purpose (image spanning 7 cols, text in 4, offset).
- Mix density: generous storytelling sections next to dense, efficient product grids.
- Use rules (1px lines), numbers, labels and captions like a magazine.

**Imagery**
- Real, consistent product photos; lifestyle in real places; crops that bleed off edges; vary scale.
- Light grain/texture only if it fits the brand; never as a trick to hide generic content.

**Motion**
- 120-320ms, ease-out, no bounce. Animate opacity/transform only. Respect `prefers-reduced-motion`.
- Good uses: drawer slide, image fade-in on load, hover image swap on product cards, add-to-cart confirmation.

**Details that prove humans**
- Real numbers (orders shipped, years, city), founder photo/signature, packaging, team, process, handwritten notes, local references.

## Step 4 - Review rubric

Score each 1-10 and fix anything below 7:
- **Credibility:** could a real company have made this? Real photos, real proof, real details?
- **Distinctiveness:** would you recognize this brand with the logo hidden?
- **Clarity:** in 5 seconds on mobile, do I know what's sold and where to tap?
- **Consistency:** same radius, spacing scale, type scale, photo style everywhere?
- **Restraint:** is every effect justified by the art direction?

List each AI tell found as: `location - pattern - severity (high/med/low) - replacement`.

## Never trade away

Accessibility (contrast, focus, sizes), performance (images optimized, no heavy effect libraries), and conversion basics (price, CTA, shipping info visible).
