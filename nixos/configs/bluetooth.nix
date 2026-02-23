{
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Experimental = true;          # ← це ключове!
        Enable = "Source,Sink,Media,Socket";
        ControllerMode = "dual";      # або "bredr" якщо проблеми
      };
      Policy = {
        AutoEnable = true;
      };
    };
  };
}
