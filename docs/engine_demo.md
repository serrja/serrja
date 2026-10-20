# Pokerlost engine demo

A real synthetic two-player hand ran through the installed public Python API and a
loopback TCP server. C++20 owns validation, state and settlement; Python handles
transport, input and display. This recording is from source `ea1b4177bb7b2f0c46c775f4e34f6941e6affec8`.
The implementation repository is private. These captured outputs are public.

## Read the actual capture

- [Alice console](../assets/engine_demo/ea1b4177bb7b2f0c46c775f4e34f6941e6affec8/alice.txt), [Bob console](../assets/engine_demo/ea1b4177bb7b2f0c46c775f4e34f6941e6affec8/bob.txt),
  [server console](../assets/engine_demo/ea1b4177bb7b2f0c46c775f4e34f6941e6affec8/server.txt).
- [Provenance and file checksums](../assets/engine_demo/ea1b4177bb7b2f0c46c775f4e34f6941e6affec8/provenance.json).

Plain logs only remove ANSI control sequences and normalize line endings from the
original terminal recording. They contain synthetic public views, with hole cards
hidden. No generated terminal picture or invented transcript is used.

The run joined two players, started a hand, rejected an illegal check and an
out-of-turn action without advancing state, then completed an all-in/call and
native settlement. Bob received 2000 synthetic chips; rake was zero. This is one
recorded functional scenario, not a performance or production claim.

## Replay

From a checkout of this profile repository on a system with util-linux:

```bash
scriptreplay --log-timing assets/engine_demo/ea1b4177bb7b2f0c46c775f4e34f6941e6affec8/alice.timing --log-out assets/engine_demo/ea1b4177bb7b2f0c46c775f4e34f6941e6affec8/alice.typescript --divisor 0.1
```

Original recordings: [Alice](../assets/engine_demo/ea1b4177bb7b2f0c46c775f4e34f6941e6affec8/alice.typescript) / [timing](../assets/engine_demo/ea1b4177bb7b2f0c46c775f4e34f6941e6affec8/alice.timing),
[Bob](../assets/engine_demo/ea1b4177bb7b2f0c46c775f4e34f6941e6affec8/bob.typescript) / [timing](../assets/engine_demo/ea1b4177bb7b2f0c46c775f4e34f6941e6affec8/bob.timing),
[server](../assets/engine_demo/ea1b4177bb7b2f0c46c775f4e34f6941e6affec8/server.typescript) / [timing](../assets/engine_demo/ea1b4177bb7b2f0c46c775f4e34f6941e6affec8/server.timing).

The private demo provides headless/interactive server modes and two console
clients. Its controls include state, legal actions, fold/check/call/bet/raise,
all-in, settle, result, events and quit. The captured wheel was built from the same
clean source commit and imported from site-packages. The owner suite passed 201
Python tests and native C++ suites; the actual recording also checked privacy,
illegal-action atomicity and clean disconnect.

There is no network authentication or TLS in this local example: use loopback or
an isolated test network. Multiplayer platform orchestration, accounts, ledger and
payments remain in development. Source access and publication are separate owner
decisions. See the [public project overview](https://github.com/pokerlost).

[Back to the profile](../README.md).
