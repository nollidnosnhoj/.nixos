{
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = false; # TODO: wsl -> false; msa1 -> true
}
