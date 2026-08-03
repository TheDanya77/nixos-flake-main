{
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  networking.firewall = {
    # enable = true;  # явно вказуємо, що firewall активний (рекомендовано)

    # allowedTCPPorts = [ 7777 7878 27036 8080 ];
    # allowedUDPPorts = [ 7777 7878 27036 8080 ];

    allowedUDPPortRanges = [
      # { from = 27000; to = 27100; }
      # { from = 4380; to = 4380; }
      # { from = 7777; to = 7878; }
      # { from = 27036; to = 27036; }
    ];
  };
}
