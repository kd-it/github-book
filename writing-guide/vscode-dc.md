# VisualStudio CodeとDevContainerによる環境構築

VisualStudio Code(VSCode)とDocker環境を持っていれば、DevContainerによる汚染の少ない環境で執筆が行えます。

## 環境構築

1. とりあえず一度VSCodeでCloneしたワークツリーを開いてください
2. コマンドパレットで `Reopen in container` を指示してください

これで環境構築を開始して、準備ができたらワークスペースを開き直します。

## ビルド方法

あとは普通に文書を記述後、ローカル環境同様にビルドが可能ですが、コンテナ環境では自動的に `sphinx-autobuild` が動くように設定しています。
そのため、放っておいても自動的にビルドが行われ、その結果は http://localhost:8000/ で確認できます。

