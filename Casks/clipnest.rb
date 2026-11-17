cask "clipnest" do
  version "1.1.0"
  sha256 "2a61558b7184ee9e44e327581c201884c1d96dece0161eec6d150df9e8fab7ae"

  url "https://github.com/nekoleamo/clipnest/releases/download/v#{version}/clipnest-#{version}-macos.zip"
  name "clipnest"
  desc "剪贴板历史管理器，自带 NAS 同步"
  homepage "https://github.com/nekoleamo/clipnest"

  app "clipnest.app"

  # 本项目没有购买 Apple Developer Program，因此没有公证（notarization），官方 homebrew-cask
  # 不收，只能放自建 tap。brew 自己用 curl 下载不带 com.apple.quarantine，
  # 这里只是兜底（万一缓存里的包带着），删掉才能正常启动。
  #
  # 用 postflight_steps 而不是已废弃的 postflight：新版 Homebrew 里后者会报警告，
  # 而 steps DSL 里没有 appdir 方法，路径要用 {{appdir}} 模板 token。
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/clipnest.app"]
  end

  # brew uninstall --zap：数据与可选的登录项一起清掉
  zap trash: [
    "~/Library/Application Support/clipnest",
    "~/Library/LaunchAgents/com.clipnest.app.plist",
  ]
end
