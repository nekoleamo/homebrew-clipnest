# homebrew-clipnest

clipnest 的 Homebrew tap。

```bash
brew tap nekoleamo/clipnest
brew install --cask clipnest
brew upgrade --cask clipnest     # 升级
brew uninstall --zap --cask clipnest   # 连数据一起删
```

国内网络用 Gitee 镜像（cask 里的下载地址也换成 Gitee 附件，拉包也走 Gitee）：

```bash
brew tap null_593_5354/clipnest https://gitee.com/null_593_5354/homebrew-clipnest
```

## 为什么要自建 tap

clipnest 没有购买 Apple Developer Program，所以没有公证（notarization），官方 homebrew-cask
不收。这个 cask 用 `postflight` 删掉 quarantine 标记，所以装完能直接启动。

## 这个仓库是生成的

`Casks/clipnest.rb` 由主仓库的 `tools/release-go.sh` 生成，发版时同步过来。要改内容请改那边。

上游：[nekoleamo/clipnest](https://github.com/nekoleamo/clipnest)
