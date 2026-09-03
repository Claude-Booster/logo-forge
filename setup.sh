#!/usr/bin/env bash
# One-time dev setup. Run once after cloning.
set -euo pipefail

HOOKS_DIR=".githooks"
BLOCKED="$HOOKS_DIR/.blocked"
BLOCKED_EXAMPLE="$HOOKS_DIR/.blocked.example"

# ── 1. Point git at the committed hooks directory ──────────────────────────
git config core.hooksPath "$HOOKS_DIR"
echo "  hooks path → $HOOKS_DIR"

# ── 2. Create .blocked from the example if it doesn't exist yet ────────────
if [ ! -f "$BLOCKED" ]; then
    cp "$BLOCKED_EXAMPLE" "$BLOCKED"
    echo "  created    $BLOCKED  (fill in your patterns)"
else
    echo "  exists     $BLOCKED  (unchanged)"
fi

echo ""
echo "Setup complete. Edit $BLOCKED to add your personal identifier patterns."
