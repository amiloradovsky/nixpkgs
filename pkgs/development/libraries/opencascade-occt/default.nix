{ stdenv
, fetchurl
, cmake
, tcl
, tk
, vtk
, mesa_glu
, libXext
, libXmu
, libXi
, doxygen
}:

let version = "7.3.0p2";
    patch = "p2";
    commit = "V7_3_0p2";

in stdenv.mkDerivation {

  name = "opencascade-occt-${version}";

  src = fetchurl {
    name = "occt-${commit}.tar.gz";
    url = "https://git.dev.opencascade.org/gitweb/?p=occt.git;a=snapshot;h=${commit};sf=tgz";
    sha256 = "0nc9k1nqpj0n99pr7qkva79irmqhh007dffwghiyzs031zhd7i6w";
  };

  buildInputs = [ cmake tcl tk vtk mesa_glu libXext libXmu libXi doxygen ];

  enableParallelBuilding = true;

  meta = with stdenv.lib; {
    description = "Open CASCADE Technology, libraries for 3D modeling and numerical simulation";
    homepage = "https://www.opencascade.org/";
    license = licenses.lgpl21;  # essentially...
    # The special exception defined in the file OCCT_LGPL_EXCEPTION.txt
    # are basically about making the license a little less share-alike.
    maintainers = with maintainers; [ amiloradovsky ];
    platforms = platforms.all;
  };

}
