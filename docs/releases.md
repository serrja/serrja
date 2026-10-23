# Releases

Decide compatibility, update VERSION/changelog, run `make ci-local`, review and integrate into main
only with successful exact required checks. Recheck the clean integrated commit and inspect tag
workflow triggers before creating an authorized annotated `v<version>` tag. The documentation workflow is manual; the contribution workflow checks PR naming. Verify triggers on the exact commit before promotion.

Push one exact new tag ref and compare its remote object and peeled commit. Never move a published
tag or use `git push --tags`. GitHub Releases, image/package publication and deployment remain
separate decisions. Billing-blocked mandatory checks preserve the PR/branch, and local success does
not claim hosted success. Source or metadata changes invalidate earlier artifacts and reports.

Preserve the existing banner, factual personal text, access and account settings. New demo recordings stay local in pokerDemo; older published captures remain in Git history and may still be present on main.
See [versioning](versioning.md) and [contributing](../CONTRIBUTING.md).
