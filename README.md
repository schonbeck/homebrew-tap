# schonbeck/homebrew-tap

Homebrew formulae for Linux tools by Stephan Victor Schönbeck.

```sh
brew install schonbeck/tap/klip
```

| Formula | Description |
| --- | --- |
| [klip](https://github.com/schonbeck/klip) | Simple Wayland screenshot tool: select, annotate, copy or save |

`Formula/klip.rb` builds klip from its release source tarball, and
`brew install` pours a prebuilt bottle (x86_64 Linux, standard prefix
`/home/linuxbrew/.linuxbrew`) when there is one; otherwise it builds from
source (about 2 minutes).

## Bottles

The standard `brew tap-new` setup, Linux only:

1. A pull request changes a formula (for a klip release: `url` and `sha256`,
   via `packaging/bump-formula.sh <version> Formula/klip.rb` in the klip repo).
2. `tests.yml` runs `brew test-bot`, which builds, tests and bottles it, and
   uploads the bottle as a workflow artifact.
3. When that's green, add the **`pr-pull`** label to the PR (instead of
   pressing Merge), or run the "brew pr-pull" workflow with the PR number.
   `publish.yml` uploads the bottle to a release of this repo
   (`klip-<version>`), adds the `bottle do` block, pushes the PR's commits and
   the bottle commit to `main`, and closes the PR.

Both workflows use only the built-in `GITHUB_TOKEN`. Merging a formula PR
with the Merge button instead works too, but then there's no bottle until
the next formula PR.
