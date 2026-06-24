# Builder-Taker Civilizational Dynamics

This repository preserves and presents a working theory of civilizational change:

> Builders create new surplus by opening frontiers. Takers capture surplus by controlling gates. Civilizational renewal depends on whether new Builders can break old rent structures without becoming the next gatekeepers.

## Files

- `index.html` - GitHub Pages-ready landing page.
- `docs/framework.md` - canonical Markdown source document.
- `styles.css` - page styling.
- `scripts/publish-github-pages.sh` - optional helper to create a GitHub repo, push this project, and enable GitHub Pages.

## Publish With GitHub Pages

1. Install and authenticate GitHub CLI:

   ```bash
   gh auth login
   ```

2. From this directory, run:

   ```bash
   ./scripts/publish-github-pages.sh YOUR_GITHUB_USERNAME builder-taker-civilizational-dynamics public
   ```

   GitHub Pages is available for public repositories on GitHub Free. Use `private` only if your GitHub plan supports Pages for private repositories.

3. The site will be available at:

   ```text
   https://YOUR_GITHUB_USERNAME.github.io/builder-taker-civilizational-dynamics/
   ```

## Preservation Strategy

- Keep `docs/framework.md` as the source of truth.
- Commit every major revision.
- Use GitHub as the version history.
- Export important versions to PDF when the argument stabilizes.
