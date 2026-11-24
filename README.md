# schonbeck/homebrew-tap

Homebrew formulae for Linux tools by Stephan Victor Schönbeck.

```sh
brew install schonbeck/tap/klip
```

| Formula | Description |
| --- | --- |
| [klip](https://github.com/schonbeck/klip) | Simple Wayland screenshot tool: select, annotate, copy or save |

`Formula/klip.rb` builds klip from its release source tarball. Its `url` and
`sha256` are bumped for each klip release (klip's release workflow or
`packaging/bump-formula.sh` in the klip repo).

Note: until klip v0.1.0 is released, the formula's sha256 is a placeholder
and `brew install` fails its checksum.
