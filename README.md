# Pip-Technical-Guidelines

Technical guidelines book for the Poverty and Inequality Platform (PIP) team at the World Bank.

The book is hosted internally on Posit Connect, not on public GitHub Pages.

## How deployment works

Deployment uses Posit Connect's **Git-backed content**: Posit Connect pulls this repository directly, renders the Quarto book on the Connect server, and serves it internally.

- The repo ships a `manifest.json` (at the repo root) that tells Connect how to build and host the book.
- `manifest.json` was generated with `rsconnect::writeManifest()` (see below) and must be kept up to date in commits when the book's dependencies change.
- The `.github/workflows/publish.yml` GitHub Actions job is now only a build check: it renders the book on `main` to catch errors, but no longer publishes to GitHub Pages.

## One-time setup in Posit Connect

1. Sign in to the internal Connect server as a user with at least Publisher role.
2. On the **Content** page, click **Publish** → **Import from Git**.
3. Repository URL: `https://github.com/GPID-WB/Pip-Technical-Guidelines.git`
4. Branch: `main`
5. Target directory: repo root (Connect detects the `manifest.json` there)
6. Click **Deploy Content**. Connect renders the book server-side and starts serving the internal URL.

After that, every push to `main` is picked up by Connect's polling (default every 15 minutes) and redeployed.
You can also click **Update Now** in the content's **Settings** > **Source** panel to force a redeploy.

## Regenerating manifest.json

After installing or removing R packages used by the book, regenerate the manifest from the repo root:

```r
install.packages("rsconnect")
library(rsconnect)
writeManifest(appDir = ".", quarto = TRUE, contentCategory = "site")
```

Commit the updated `manifest.json` together with the package changes.