{ pkgs, ... }:

{
  services.ollama = {
    enable = true;
    package = pkgs.ollama-rocm;
    host = "127.0.0.1";
    port = 11434;
  };

  services.open-webui = {
    enable = true;
    port = 8080;
    environment = {
      OLLAMA_API_BASE_URL = "http://127.0.0.1:11434";
    };
  };
}
