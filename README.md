# nixos

NixOS configuration for rmbp laptop with agenix secret management.

## Quick Deploy

```bash
nix run github:apoloqize/deploy-rs .#rmbp 
```

Or using the Makefile:
```bash
make deploy
```

## Secret Management

This configuration uses **agenix** for managing secrets (Tailscale auth keys, etc.).

**📖 See [AGENIX_MIGRATION.md](./AGENIX_MIGRATION.md) for complete migration guide and usage instructions.**

### Quick Start with Secrets

1. Update flake: `nix flake update`
2. Install agenix CLI: `nix shell github:ryantm/agenix`
3. Edit secrets: `agenix -e hosts/rmbp/tailscale-authkey.age`
4. Deploy: `make deploy`
