# Development

Daily policy: use `dev`, run `make lint`, inspect the staged diff, then explicitly
`git push origin dev`. `main` and `test` are preserved. Test, typecheck, build,
coverage and full acceptance commands below are manual. New manual Actions in
`dev` may require a later authorized default-branch activation.

This repository owns the public profile and its existing presentation/demo assets as one source
bundle. Development changes do not authorize new biography claims or regeneration of the banner.

Use Git, Make, Docker/Buildx, bash and coreutils from the exact checkout:

```bash
make help
make version
make ci-local
```

The local gate checks Markdown/links and whitespace, reports runtime coverage as notApplicable,
packages the source bundle, verifies its members/bytes and checks release metadata. It uses a
locked tools image with persistent local BuildKit cache; checks execute fresh each time.
`make check`, `test`, `coverage`, `build`, `verify` and `release-check` select the corresponding
native operation. There is no application runtime image or Kubernetes requirement.

First preparation may fetch dependencies. `OFFLINE=1` verifies the exact prepared tools image and
source inputs before running without network. Missing inputs are blocked, invalid reports/checks
fail, and no Actions API, token, hosted artifact/cache or GITHUB_* variable is required.
`coverage/` holds source SHA/dirty state/content identity, commands, tools and checksums; `dist/`
holds the bundle. Existing assets and historical refs remain unchanged.

See [versioning](versioning.md), [releases](releases.md) and [contributing](../CONTRIBUTING.md).
