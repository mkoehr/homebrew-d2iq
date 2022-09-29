class Dkp < Formula
  desc "D2IQ Kubernetes Platform command line tool"
  homepage "https://www.d2iq.com/"
  version "2.3.0"

  depends_on "kubernetes-cli"
  depends_on "awscli" => :optional
  
  if OS.mac? && Hardware::CPU.intel?
    url "https://downloads.d2iq.com/dkp/v2.3.0/dkp_v2.3.0_darwin_amd64.tar.gz"
    sha256 "65128efe17fa9fab005567000fb0a9421aebc2408117ff89b6e7e164d66edbc5"
  end

  conflicts_with "dkp"

  def install
    bin.install "dkp"
    generate_completions_from_executable(bin/"dkp", "completion")
  end

  test do
    assert_match "dkp: v#{version}", shell_output("#{bin}/dkp version | grep dkp")
  end
end
