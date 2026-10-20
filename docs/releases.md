# Releases

Decide compatibility, update VERSION/changelog, run `make ci-local`, review and integrate into main
only with successful exact required checks. Recheck the clean integrated commit and inspect tag
workflow triggers before creating an authorized annotated `v<version>` tag. The existing workflows
run on main/PR only; verify that from the commit rather than relying on this statement forever.

Push one exact new tag ref and compare its remote object and peeled commit. Never move a published
tag or use `git push --tags`. GitHub Releases, image/package publication and deployment remain
separate decisions. Billing-blocked mandatory checks preserve the PR/branch, and local success does
not claim hosted success. Source or metadata changes invalidate earlier artifacts and reports.

The existing banner, recordings, personal text, access and account settings are preserved.
See [versioning](versioning.md) and [contributing](../CONTRIBUTING.md).
