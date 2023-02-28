# ローカル環境での環境

ローカル環境で構築する場合、以下のものが必要となります。

- Python3(本原稿は3.10を使用しています)
- jupyter book
- Sphinx
- sphinx-autobuild

文書の作成については方法を問わず共通ですのでここでは割愛します。

## 環境構築

Python3をインストールしていることを前提として、必要なモジュールをセットアップしていきます。

```zsh
# SphinxはJupyter bookを入れるときに依存関係で入ります
% pip install jupyter-book sphinx-autobuild
```

`pipenv` を利用している方は、`pipenv install` でたぶん構築できます。

## 文書のフォーマット

文書のフォーマットは、Jupyter bookの機能で行います。

```zsh
% jupyter book build .
```

面倒な人は GNU make が入っていれば

```zsh
% make build
```

で行えます。
成果物は `_build/html` 以下にHTMLで置かれるので、ブラウザで開いてもらえれば確認できます。

## 自動ビルドとブラウザ連動

いちいちビルドを行うのが面倒であれば、 `sphinx-autobuild` でCI環境を構築できます。

```zsh
% sphinx-autobuild --delay 3 --open-browser . _build
# GNU makeが入っていれば簡略化可能
% make server
```

いずれにしても、デフォルトでポート番号8000で簡易サーバーが起動するので、 http://localhost:8000/ 以下で開くことができます。
閲覧中にコードを書き換えた場合も、しばらくすると自動で作成され、ブラウザ側は自動的にリロードされて反映されます。