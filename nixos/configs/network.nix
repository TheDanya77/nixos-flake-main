{
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  networking.firewall = {
    allowedTCPPorts = [ 27036 ];
    allowedUDPPortRanges = [
      { from = 27000; to = 27100; }
      { from = 4380; to = 4380; }
    ];
  };
}
