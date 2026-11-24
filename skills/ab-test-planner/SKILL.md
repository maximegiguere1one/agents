---
name: ab-test-planner
description: Plan, size and read e-commerce A/B tests correctly - hypothesis, primary metric, guardrails, sample size and duration, and decision rules, including what to do on low-traffic stores. Use before launching a test or when interpreting results.
---

# A/B test planner

## 1. Should this be a test at all?

- **Ship directly** if it's a clear usability bug or a well-established best practice (broken mobile layout, missing shipping info, slow images).
- **Test** if the outcome is uncertain and the change is big enough to detect.
- **Low traffic** (few hundred orders/month): small tweaks (button colour, wording) can't be detected in a reasonable time. Test only bold changes, or use add-to-cart rate as the primary metric (more events), or ship and monitor before/after with caution.

## 2. Test card

```
Name:
Hypothesis: Because we observed [evidence], we believe [change] for [audience]
            will increase [primary metric]. We'll know when [threshold].
Page / audience / devices:
Control vs Variant: (screenshots or exact specs)
Primary metric: (one) e.g. conversion rate (orders / sessions) or add-to-cart rate
Guardrails: AOV, revenue per visitor, refund rate, page speed
Minimum detectable effect (relative): e.g. 10%
Sample size per variant:
Planned duration: (full weeks, min 2 business cycles)
Decision rule: written before launch
```

## 3. Sample size (two proportions, 95% confidence, 80% power)

Approximation per variant:

```
n ≈ 16 × p × (1 − p) / (p × MDE)²
```
where `p` = baseline rate, `MDE` = relative lift to detect.

Example: baseline conversion 2% (p = 0.02), MDE 10% → absolute diff 0.002 →
n ≈ 16 × 0.02 × 0.98 / 0.002² ≈ 78,400 sessions per variant.

Same test on add-to-cart rate of 8%: n ≈ 16 × 0.08 × 0.92 / 0.008² ≈ 18,400 per variant.

Duration = n × variants / eligible daily sessions, rounded up to full weeks. If longer than ~6 weeks, increase the MDE (bolder change) or choose a higher-frequency metric.

## 4. Running

- Randomize by visitor, not by session. Keep the split constant.
- Don't stop early because it "looks significant" - stop at the planned sample/duration.
- Avoid overlapping tests on the same page/audience; avoid major promotions mid-test (or note them).
- Check variant rendering on mobile and desktop on day 1; check sample ratio (50/50 split should hold within ~1%).

## 5. Reading results

- Report: sessions, conversions, rate per variant, relative lift, 95% confidence interval, p-value.
- Check guardrails and main segments (mobile/desktop, new/returning) for consistent direction.
- Outcomes: **Win** (significant, guardrails fine) → ship. **Loss** → revert, document learning. **Inconclusive** → effect smaller than MDE; keep the simpler/cheaper version, document it.
- Log every test (hypothesis, result, learning) so the team doesn't repeat it.

## Tools

Shopify-compatible testing apps (e.g. for theme/price/content tests) or a server-side/edge split. Measure orders from Shopify data, not only from the testing tool's pixel.
