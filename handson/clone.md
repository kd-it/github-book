# リポジトリのクローン

続いて、リポジトリのクローンを行ってみます。
クローンとは、リポジトリ上にあるプロジェクトの構成情報(コミット情報)を取得して、リポジトリのコピーを作成する行為です(だからクローン)。
そのためには、親となるリポジトリのアドレスが必要になります。

## アドレスの取得

![](images/repo-addr.png)

リポジトリのアドレスは、https形式のものとssh形式のものがありますが、最近ではhttpsが広く使われています。
アドレス形式の確認の上、クリップボードにコピーしておきます。

![](images/repo-addr-annotated.png)

## クローン処理

クローンを行うためには、GUIもありますがここではコマンドラインを使います。
ターミナル(コマンドプロンプト or Git Bash)を開き、適当なディレクトリに移動しておいてください。

```{tip}
Windows10や11であれば、エクスプローラから該当ディレクトリをPowerShellで開くメニュー項目があるので、それを使うと良いでしょう。
```

プロンプトにて、以下のコマンドを打ち込みます。

```pwsh
PS> git clone コピーしておいたリポジトリアドレスをペースト
```

```pwsh
PS /private/tmp> git clone https://github.com/densuke-st/hello-world.git
Cloning into 'hello-world'...
warning: You appear to have cloned an empty repository.
PS /private/tmp> cd hello-world # 中に入っておく
```

※ この端末(ターミナル)はこの後も使うので閉じないでください(最小化してあとで再利用するのはOK)。

今回のリポジトリは作ったばかりのため空っぽです。そのためコミットが存在せず **empty repository**(空のリポジトリ)と言われています。
warningが付いているものの、これは**今回は正しい**ので安心してください。

特に指定しなければ、リポジトリの名前(hello-world)という名前のディレクトリが作成されるので、エクスプローラやFinderで開くと、中身の確認ができます。

![Finderでの表示例(空)](images/repo-finder.png)
Finderでの表示例(空)

![Explorerでの表示例(空)](images/repo-explorer11.png)
Windows11のExplorerでの表示例(空)

```{tip}
正確には空ではなく、リポジトリとしての情報を保有する管理ディレクトリ(`.git`)が作成されています。
Explorerでは見えなくするために隠しファイル属性が適用されていますし、Finder(macOS)ではドットファイルであるため通常は不可視状態になっています。
```

```{tip}
gitでは、リポジトリはディレクトリと内包する管理ディレクトリ(`.git`)で構成されています。
ディレクトリ内にファイルやディレクトリ(フォルダ)を配置していくことになり、この部分を**ワークツリー**(working tree)と表現されることもあります。

その一方で、 `.git` の中はリポジトリとしての管理情報が含まれていて、以下のような物が含まれています。

- リポジトリのメタデータ(クローン元のアドレスなど)
- コミットオブジェクト(ざっくり言えばリポジトリに含まれるファイルなど)
- ステージング情報(次にコミットするときの対象物が入っている場所)
```