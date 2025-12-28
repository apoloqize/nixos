# OpNix secrets configuration for rmbp
# This file defines the 1Password secrets to be managed by OpNix
{
  services.onepassword-secrets = {
    enable = true;
    tokenFile = "/etc/opnix-token";
    
    secrets = {
      # Tailscale authentication key
      tailscaleAuthkey = {
        reference = "op://nixos/Tailscale/authkey";
        path = "/run/secrets/tailscale-authkey";
        mode = "0400";
        owner = "root";
        group = "root";
      };
      
      # Tailscale login server URL
      tailscaleLoginServer = {
        reference = "op://nixos/Tailscale/login-server";
        path = "/run/secrets/tailscale-login-server";
        mode = "0400";
        owner = "root";
        group = "root";
      };
      
      # OpenRouter API key
      openrouterApiKey = {
        reference = "op://nixos/OpenRouter/api-key";
        path = "/run/secrets/openrouter-api-key";
        mode = "0400";
        owner = "root";
        group = "root";
      };
    };
    
    # Automatically restart services when secrets change
    systemdIntegration = {
      enable = true;
      services = [ "tailscaled" "open-webui" ];
      restartOnChange = true;
    };
  };
}
