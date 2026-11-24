---
name: shopify-section-builder
description: Conventions and a ready template for building Shopify Online Store 2.0 sections and blocks - schema, settings, presets, locales, metafields, responsive images, scoped CSS, accessible JS - safely on an unpublished theme. Use when creating or editing any Shopify theme section, block or snippet.
---

# Shopify section builder

## Safety workflow

1. List themes; identify the live (main) theme. **Never edit it directly.**
2. Duplicate it (or use an existing unpublished/dev theme) and work there.
3. Read every file before editing. Keep a list of changed files.
4. Preview (screenshot or preview link) on mobile and desktop.
5. Publish **only** after the merchant explicitly approves.

## File layout

```
sections/<name>.liquid        markup + {% schema %}
assets/section-<name>.css     scoped styles (loaded by the section)
assets/<name>.js              optional web component, deferred
snippets/<part>.liquid        reusable pieces, used with {% render %}
locales/en.default.json, fr.json, *.schema.json   all strings
```

## Section template

```liquid
{{ 'section-feature-split.css' | asset_url | stylesheet_tag }}

<section
  class="feature-split color-{{ section.settings.color_scheme }}"
  style="--pad-top: {{ section.settings.padding_top }}px; --pad-bottom: {{ section.settings.padding_bottom }}px;"
  aria-labelledby="FeatureSplit-{{ section.id }}"
>
  <div class="page-width feature-split__grid{% if section.settings.image_right %} is-reversed{% endif %}">
    {%- if section.settings.image != blank -%}
      {{ section.settings.image
        | image_url: width: 1800
        | image_tag:
          widths: '600, 900, 1200, 1800',
          sizes: '(min-width: 990px) 58vw, 100vw',
          loading: 'lazy',
          class: 'feature-split__image'
      }}
    {%- endif -%}
    <div class="feature-split__content">
      {%- for block in section.blocks -%}
        {%- case block.type -%}
          {%- when 'heading' -%}
            <h2 id="FeatureSplit-{{ section.id }}" class="feature-split__heading" {{ block.shopify_attributes }}>
              {{ block.settings.heading | escape }}
            </h2>
          {%- when 'text' -%}
            <div class="rte" {{ block.shopify_attributes }}>{{ block.settings.text }}</div>
          {%- when 'button' -%}
            {%- if block.settings.label != blank -%}
              <a href="{{ block.settings.link }}" class="button" {{ block.shopify_attributes }}>
                {{ block.settings.label | escape }}
              </a>
            {%- endif -%}
          {%- when '@app' -%}
            {% render block %}
        {%- endcase -%}
      {%- endfor -%}
    </div>
  </div>
</section>

{% schema %}
{
  "name": "t:sections.feature_split.name",
  "tag": "div",
  "class": "section",
  "settings": [
    { "type": "image_picker", "id": "image", "label": "t:sections.feature_split.settings.image.label" },
    { "type": "checkbox", "id": "image_right", "default": false, "label": "t:sections.feature_split.settings.image_right.label" },
    { "type": "color_scheme", "id": "color_scheme", "default": "scheme-1", "label": "t:sections.all.colors.label" },
    { "type": "range", "id": "padding_top", "min": 0, "max": 160, "step": 8, "unit": "px", "default": 64, "label": "t:sections.all.padding.padding_top" },
    { "type": "range", "id": "padding_bottom", "min": 0, "max": 160, "step": 8, "unit": "px", "default": 64, "label": "t:sections.all.padding.padding_bottom" }
  ],
  "blocks": [
    { "type": "heading", "name": "t:blocks.heading", "limit": 1,
      "settings": [{ "type": "text", "id": "heading", "default": "Titre", "label": "t:blocks.heading" }] },
    { "type": "text", "name": "t:blocks.text",
      "settings": [{ "type": "richtext", "id": "text", "label": "t:blocks.text" }] },
    { "type": "button", "name": "t:blocks.button", "limit": 2,
      "settings": [
        { "type": "text", "id": "label", "label": "t:blocks.button_label" },
        { "type": "url", "id": "link", "label": "t:blocks.button_link" }
      ] },
    { "type": "@app" }
  ],
  "presets": [{ "name": "t:sections.feature_split.presets.name", "blocks": [{ "type": "heading" }, { "type": "text" }, { "type": "button" }] }]
}
{% endschema %}
```

Adapt `t:` keys to the theme's existing locale structure (check `locales/*.schema.json`); if the theme uses plain strings, follow that instead. Check the theme's existing color scheme ids and page-width class names before reusing them.

## Rules

- **Data from metafields** for product content: `{{ product.metafields.custom.specs.value }}` with `!= blank` guards.
- **Images:** always `image_url` + `image_tag` with `widths`/`sizes`; first above-the-fold image `loading: 'eager'`, `fetchpriority: 'high'`.
- **CSS:** scoped class prefix per section, use theme CSS variables (colours, fonts, spacing); mobile first; no `!important`.
- **JS:** custom elements (`class X extends HTMLElement`), `defer`, no jQuery, clean up listeners; re-init on `shopify:section:load` for the theme editor.
- **Accessibility:** semantic headings, `aria-labelledby`, buttons for actions/links for navigation, focus visible, `prefers-reduced-motion`.
- **i18n:** no hard-coded strings in markup - `{{ 'sections.x.y' | t }}`; FR and EN filled.
- **Snippets:** `{% render 'name', param: value %}` only.
- Validate with Theme Check if the CLI is available (`shopify theme check`).

## Test matrix

Mobile 375px / desktop 1440px · theme editor add/remove/reorder blocks · empty settings · long text · FR & EN · keyboard only · no console errors.
