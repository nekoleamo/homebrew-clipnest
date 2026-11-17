cask "clipnest" do
  version "1.0.0"
  sha256 "24cdf087a937b9772d518ff9585ef8efd163d1a8d0cbb885b3f693c4e8fd1fe7"

  url "https://github.com/nekoleamo/clipnest/releases/download/v#{version}/clipnest-#{version}-macos.zip"
  name "clipnest"
  desc "剪贴板历史管理器，自带 NAS 同步"
  homepage "https://github.com/nekoleamo/clipnest"

  app "clipnest.app"

  # 本项目没有购买 Apple Developer Program，因此没有公证（notarization）。
  # 下载来的 zip 带 com.apple.quarantine 属性，Gatekeeper 会把未公证的 app 拦下来。
  # cask 装完后删掉这个属性即可正常启动；官方 homebrew-cask 要求已公证，
  # 所以本 cask 只能放在自建 tap 里。
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/clipnest.app"]
  end

  # brew uninstall --zap：数据与可选的登录项一起清掉
  zap trash: [
    "~/Library/Application Support/clipnest",
    "~/Library/LaunchAgents/com.clipnest.app.plist",
  ]
end
