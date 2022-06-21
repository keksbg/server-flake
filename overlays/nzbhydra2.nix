self: super: {
  nzbhydra2 = super.nzbhydra2.overrideAttrs (_: rec {
    pname = "nzbhydra2";
    version = "4.3.3";
    src = super.fetchzip {
      url = "https://github.com/theotherp/${pname}/releases/download/v${version}/${pname}-${version}-linux.zip";
      sha512 = "1i8g9rqhd9gh11gmcdvdx0350yqjd5x4vk6wmzm8b054g1nlp1v8";
      stripRoot = false;
    };
  });
}
