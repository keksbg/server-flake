self: super: {
  nzbhydra2 = super.nzbhydra2.overrideAttrs (_: rec {
    pname = "nzbhydra2";
    version = "4.3.3";
    src = super.fetchzip {
      url = "https://github.com/theotherp/${pname}/releases/download/v${version}/${pname}-${version}-linux.zip";
      sha256 = "17cc393vn87gn66bwrq7ps299aikg5lzfjsb8ap6xrylj2h81qas";
      stripRoot = false;
    };
    nativeBuildInputs = with super; [ adoptopenjdk-jre-hotspot-bin-16 makeWrapper unzip ];
  });
}
