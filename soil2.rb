class Soil2 < Formula
  desc "Simple OpenGL Image Library 2"
  homepage "https://bitbucket.org/SpartanJ/soil2"
  url "https://bitbucket.org/SpartanJ/soil2/get/1c5848213798.zip"
  sha256 "ae521b89fb136a2385ba381083c617b1f5973a078758442e296fd62ececc340c"
  version "2.0.20181231"
  depends_on "premake" => :build

  def install
    system "premake4", "gmake"
    Dir.chdir('make/macosx') do
      system "make", "soil2-static-lib"
      system "make", "config=release", "soil2-static-lib"
    end
    include.install "src/SOIL2/SOIL2.h"
    lib.install Dir["lib/macosx/*"]
  end

  test do
    system "false"
  end
end
