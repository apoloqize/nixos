let
  # Age public key for rmbp host
  rmbp = "age1vaggp67u6566yqrpfl8kgasew7mp6gvuevhcsn4ef0pdv477tdyqaw4fsk";
in
{
  "hosts/rmbp/tailscale-authkey.age".publicKeys = [ rmbp ];
  "hosts/rmbp/tailscale-login-server.age".publicKeys = [ rmbp ];
}
