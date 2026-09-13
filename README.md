# orphan-watchdog

[![CI](https://github.com/okaythi/orphan-watchdog/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/okaythi/orphan-watchdog/actions/workflows/ci.yml)
[![Ubuntu](https://img.shields.io/badge/Ubuntu-24.04%20LTS%2B-E95420?logo=ubuntu&logoColor=white&style=flat-square)](https://ubuntu.com)
[![Release](https://img.shields.io/github/v/release/okaythi/orphan-watchdog?style=flat-square&color=2563eb)](https://github.com/okaythi/orphan-watchdog/releases)
[![License: CC BY-NC 4.0](https://img.shields.io/badge/license-CC%20BY--NC%204.0-334155?style=flat-square)](LICENSE)

A lightweight watchdog and process supervisor that prevents abandoned background processes and development servers from pegging CPU cores after their parent application exits.

Designed for Linux workstations running Ubuntu 24.04 LTS and newer.

---

## Installation

### From Debian Package (Recommended)

Download the `.deb` from the [Releases](https://github.com/okaythi/orphan-watchdog/releases) page:

```bash
sudo dpkg -i orphan-watchdog_1.0.4_all.deb
```

This installs the binaries, writes the default configuration, and automatically enables and starts `orphan-watchdog.timer`.

### From Source

```bash
git clone https://github.com/okaythi/orphan-watchdog.git
cd orphan-watchdog
sudo make install
sudo systemctl daemon-reload
sudo systemctl enable --now orphan-watchdog.timer
```

---

## Usage

### Supervising Child Processes
Prefix any background command or server with `mcp-guardian` to bind its process tree lifecycle directly to the caller:

```bash
mcp-guardian npx @some/server run
```

### Running an Audit (Dry Run)
Inspect what the watchdog would act upon without sending signals:

```bash
orphan-watchdog --dry-run
```

---

## License

Creative Commons Attribution-NonCommercial 4.0 International ([CC BY-NC 4.0](LICENSE)).
