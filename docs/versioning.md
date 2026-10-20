# Versioning

`VERSION` is the single canonical version of this documentation/presentation bundle. The first
explicit version is 0.1.0; prior Git snapshots remain valid provenance. README, banner, documents
and existing demo recordings share the bundle version and Git snapshot. They are not independent
runtime applications or separately versioned pages.

Stable major changes break the supported bundle/interface contract, minor adds compatible content
and patch corrects compatible content/tooling. During 0.x, a breaking minor change needs explicit
migration notes; patch remains compatible. PEP 440 prereleases require explicit opt-in. Changes
to other repositories' application, protocol, schema or database versions do not change this
version automatically. Review public claims, links, tool prerequisites and preserved asset bytes.

`make version` reads the canonical source. `make release-check` compares the built archive and
source-bound metadata. Primary tags are annotated `v<version>` tags on checked main commits.
See [development](development.md) and [releases](releases.md).
