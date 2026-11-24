---
name: cro-audit
description: Step-by-step conversion rate optimization audit for an e-commerce store (Shopify or other) - funnel measurement, template-by-template checklist, scoring and a prioritized ICE backlog. Use when asked to audit a store, find why it doesn't sell, or plan conversion improvements.
---

# CRO audit

## 1. Funnel data (last 30 days vs previous 30 and same period last year)

Collect per device (mobile/desktop) and top 5 traffic sources:

| Step | Count | Step rate |
|---|---|---|
| Sessions | | - |
| Sessions with product view | | /sessions |
| Sessions with add to cart | | /product view |
| Sessions reaching checkout | | /add to cart |
| Orders | | /checkout |

On Shopify: use the analytics query tool (ShopifyQL) - check the schema/docs for the exact dataset and field names before querying. Also note AOV, top landing pages, top products by views and by revenue, on-site search terms.

Mark the step with the biggest absolute loss. That's where to audit first.

## 2. Checklist (✅ ok / ⚠️ weak / ❌ missing)

**Site-wide**
- [ ] Mobile LCP < 2.5s, CLS < 0.1 (PageSpeed Insights on home, collection, product)
- [ ] Announcement bar with one real, useful message (shipping threshold, delivery time)
- [ ] Search visible, handles typos/synonyms, shows products as you type
- [ ] Menu organized by how customers shop
- [ ] Contact options visible (email, chat, phone if any)
- [ ] French and English complete for Quebec (Bill 96); prices `49,99 $`
- [ ] Tap targets ≥ 44px, body text ≥ 16px, contrast ≥ 4.5:1
- [ ] No intrusive pop-up on first second / blocking mobile content
- [ ] Design credibility: passes `anti-ai-design` rubric (≥ 7 on credibility)

**Home**
- [ ] In 5s: what's sold, for whom, why here
- [ ] Hero shows the product or real use, CTA to main collection
- [ ] Best sellers and main categories within 1-2 swipes
- [ ] Real social proof (reviews count, ratings, press, real numbers)

**Collection**
- [ ] Filters matching purchase criteria (size, age, colour, price, availability)
- [ ] Default sort useful (best selling or curated)
- [ ] Cards: consistent image ratio, price, rating, variant colours, sold-out state
- [ ] 2 columns on mobile

**Product**
- [ ] Price, shipping cost/delay, return policy visible near CTA without scrolling (mobile)
- [ ] 5+ real photos incl. scale and in-use, zoom, video if possible
- [ ] Variant buttons/swatches (not dropdowns when ≤ 8 options), selected value shown
- [ ] Size/age guide in a drawer
- [ ] Primary CTA full width on mobile + sticky add-to-cart
- [ ] Express checkout (Shop Pay / Apple Pay / Google Pay)
- [ ] Reviews with photos, near the top summary and full below
- [ ] Benefits + specs + FAQ from real customer questions
- [ ] Complementary products

**Cart**
- [ ] Cart drawer opens on add, editable quantity, remove
- [ ] Free shipping progress bar
- [ ] Clear totals, taxes/shipping note, no surprises
- [ ] Express checkout buttons
- [ ] At most one relevant upsell block

**Checkout & post-purchase**
- [ ] Shipping rates and delays consistent with what was promised on the PDP
- [ ] Discount field doesn't cause abandonment (no public "secret code" hunt)
- [ ] Order confirmation & shipping notifications branded, bilingual

**Trust**
- [ ] Real reviews (no fabricated), return/refund policy page clear, About page with real people/place
- [ ] No fake urgency or scarcity

## 3. Voice of customer

Extract the top 10 objections/questions from reviews, support, returns, search terms. Map each to the page that should answer it.

## 4. Backlog

| # | Finding (evidence) | Hypothesis | Page | I | C | E | ICE | Ship/Test |
|---|---|---|---|---|---|---|---|---|

ICE = (Impact + Confidence + Ease) / 3, each 1-10. Ship obvious fixes; test uncertain bets (see `ab-test-planner`).

## 5. Report

1. Summary (3 sentences): where the store loses buyers and the top 3 fixes.
2. Funnel table.
3. Findings with screenshots/evidence.
4. Backlog sorted by ICE.
5. Two-week plan.
