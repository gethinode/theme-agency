# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Development Commands

```bash
npm run start          # Vendor modules then start Hugo dev server on :1313
npm run build          # Production build (vendor → clean → hugo --gc --minify)
npm test               # ESLint + Stylelint + Markdownlint (pre-commit hook)
npm run mod:vendor     # Re-vendor Hugo modules after go.mod changes
npm run mod:update     # Update all Hugo modules (clears _vendor first)
npm run upgrade        # Update npm deps + Hugo modules
```

Individual linters:

```bash
npm run lint:scripts   # ESLint on assets/js/
npm run lint:styles    # Stylelint on assets/scss/**
npm run lint:markdown  # Markdownlint on *.md and content/**/*.md
```

Build headers (generates server.toml and netlify.toml from Hugo segments):

```bash
npm run build:headers
```

## Architecture

### Hugo Modules

This is a Hugo theme built on **Hinode v2** with content blocks from **mod-blocks**. All vendor dependencies live in `_vendor/` (gitignored), rebuilt on each `npm run start` or `npm run build`. Module imports are declared in `config/_default/hugo.toml` under `[module.imports]`.

Active module deps (in import order): `mod-bootstrap-icons`, `mod-blocks`, `mod-cookieyes/v3`, `hinode/v2`.

### Layout Architecture

Hinode v2 base templates handle the standard 3-column layout (sidebar / content / TOC), content_blocks rendering, page header, sharing, and TOC. Custom layouts here only **override** specific pieces:

| Path | Purpose |
| --- | --- |
| `layouts/single.html` | Single page: extracts `<figcaption>` from thumbnail via regex and injects it inside the body column for correct alignment at all breakpoints |
| `layouts/header.html` / `layouts/body.html` | Flat render-name overrides for all single pages |
| `layouts/contact/` | Full custom layout for the `contact` content type (single + list) |
| `layouts/_partials/footer/footer.html` | Custom footer: newsletter form + social links + logo |
| `layouts/_partials/footer/social.html` | Intentionally blank — overrides Hinode's default social links |
| `layouts/_partials/page/hero-title.html` | Hero partial override |
| `layouts/tags/list.html` | Tags list page |

**v2 layout conventions:**

- Render names are flat: `.Render "header"`, `.Render "body"`, `.Render "toc"` (not `single/header`)
- List sub-templates use sub-directories: `.Render "list/body"` → `contact/list/body.html`
- Custom partials go in `layouts/_partials/` (not `layouts/partials/`)

### Content Blocks (Bookshop / mod-blocks)

Pages use `content_blocks:` in front matter (YAML) to compose page sections. Supported block names and their v2 schema:

| Block | Key notes |
| --- | --- |
| `hero` | `heading.title`, `heading.align`, `background.backdrop`, `illustration.{image,icon,class}` |
| `about` | `heading.title`, `illustration.{image,class}`, `background.color`, no root `align` |
| `cards` | elements array with `title`, `icon`, `content`, `link` |
| `panels` | `elements` array; use `tab-type: tabs` for tabbed layout |
| `featured` | `heading.title`, `illustration.image`, `heading.align`; no `orientation` |
| `approach` | `illustration.{image,ratio}`, `background.color`, `elements` (not `steps`) |
| `articles` | `input.{section,reverse,sort,tags}`, `limit` (not `max`), `hide_empty` |
| `team` | `heading.{heading,align}` (not root `headline`/`align`) |
| `faq` | `heading.title`, `background.color` |
| `cta`, `separator`, `testimonials` | No special schema notes |

Global front matter convention: `background.color` (not `background.background`).

### Content Structure

All content is multilingual with language suffixes (`.en.md`, `.nl.md`). Content types:

- `blog/` — articles (thumbnail + markdown body)
- `cases/` — case studies
- `contacts/` — contact profile pages (uses `data/contacts.{en,nl}.yml` for CTA/block lookups)
- `services/` — service pages (content_blocks only)
- `about/` — company pages (content_blocks only)

Contact data lives in `data/contacts.{en,nl}.yml` — do NOT add `mod-docs` as a dependency; copy data directly instead.

### SCSS / Styling

- Theme variables: `assets/scss/theme/_variables.scss` — overrides Hinode defaults (e.g. `$theme-border-radius: 2rem`)
- Custom styles: `assets/scss/theme/theme.scss`, `base.scss`, `fonts.scss`
- Stylelint enforces `color-function-alias-notation`: use `rgb(var(--bs-x) / 0.5)` not `rgba(var(--bs-x), 0.5)`
- Stylelint requires an empty line before `//` comments inside rules

### Linting Rules

- **ESLint** (`eslint.config.mjs`): Flat config; lints only `assets/js/`; 2-space indent, single quotes, no semicolons
- **Stylelint** (`stylelint-config-standard-scss`): `color-function-alias-notation` enforced; `alpha-value-notation` disabled
- **Commitlint** (`commitlint.config.mjs`): Angular Conventional Commits — `feat`, `fix`, `refactor`, `style`, `docs`, `test`, `chore`. Use `!` suffix for breaking changes.

### Deployment

Hosted on Netlify. `data/netlify.toml` is the Netlify config (copied from Hugo output segment). The `build:headers` npm script regenerates it. Dart Sass is provided via the `@gethinode/netlify-plugin-dartsass` Netlify plugin.
