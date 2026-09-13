# orphan-watchdog

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

MIT License. See [LICENSE](LICENSE) for details.
