# Quick dev commands never prepare a product/build image.
ifneq ($(filter lint format format-check check,$(MAKECMDGOALS)),)
override CONTAINERIZED := 1
endif
ifneq ($(CONTAINERIZED),1)
QUALITY_IMAGE := serrja-profile:quality
QUALITY_EXTRA_TARGETS :=
COVERAGE_COMMAND = sh -ec 'printf "%s\n" "Coverage: notApplicable (documentation repository; no product runtime)." | tee coverage/summary.md'
BUILD_COMMAND = $(QUALITY_RUN) python docker/release.py bundle-build --name serrja-profile
IMAGE_COMMAND = printf "%s\n" "notApplicable: no runtime image"
VERIFY_COMMAND = $(QUALITY_RUN) python docker/release.py bundle-verify --name serrja-profile
VERSION_COMMAND = $(QUALITY_RUN) python docker/release.py version --name serrja-profile
RELEASE_CHECK_COMMAND = $(QUALITY_RUN) python docker/release.py release-check --name serrja-profile
RECEIPT_COMMAND = $(QUALITY_RUN) python docker/release.py receipt
BUILD_RECEIPT_COMMAND = $(QUALITY_RUN) python docker/release.py capture-build --name serrja-profile
OFFLINE_PREFLIGHT_COMMAND = true
QUALITY_EXTRA_TARGETS += acceptance
CI_LOCAL_TARGETS ?= acceptance coverage build verify release-check
include docker/quality.mk
else
.PHONY: help lint typecheck test check
help:
	@printf '%s\n' 'lint typecheck test check'
lint:
	git -c safe.directory=/app diff --check HEAD -- .
	python tools/check_documentation.py --documents README.md CONTRIBUTING.md docs/development.md docs/versioning.md docs/releases.md CHANGELOG.md
typecheck:
	@printf '%s\n' 'notApplicable: no product type system'
test: lint
check: lint ## Fast lint-only gate; no tests/build.

acceptance: test
endif

.PHONY: dev-policy-help
help: dev-policy-help
dev-policy-help:
	@printf '%s\n' 'Daily: make lint; explicit git push origin dev.' \
	  'Manual only: test, typecheck, coverage, build, acceptance, ci-local.' \
	  'Native lint tools must be installed; lint never syncs/builds the application.'
