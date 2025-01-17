# Python_Scrape

pythonでスクレイピングをすぐに始めたい時に使えるリポジトリ。  
powershellのスクリプトで環境を整える。 
[Beautiful Soup - 日本語ドキュメント](http://kondou.com/BS4/)

## 環境と仕様
- OS  
    - windows10  
- 使用するライブラリ  
    - requests  
    - beautifulsoup4  
    - jupyter  
    - selenium  
    **※詳しくは「[requirements.txt](./requirements.txt)」を参照。**   
- [setup.ps1](./setup.ps1)について
    - 仮想環境の作成、起動、再起動
    - requirements.txtのバックアップ出力
    - pythonライブラリのインストール
    - jupiterの起動を行う

## 事前準備（windows10-64bitの場合）

- python3.8がインストールされていること  
⇒未インストールの場合は下記手順でインストールを行う  
    - [Python 公式 サイト](https://www.python.org/)にアクセスし、メニューの「Download」から「windows」を選択する。  
    - 「 Windows x 86-64 executable installer」をクリックして、インストーラーをダウンロードする。  
    - インストーラーを起動し、「Add Python3.8 to PATH」にチェックをいれ、「install now」をクリックする。  
    - cmdから「python --version」でインストールされているか確認する。  
    （pythonのバージョン情報が表示されていれば成功）  

## 使い方（リポジトリ）

リポジトリをクローンし、[setup.ps1](./setup.ps1)を実行すると、  
ローカルサーバーでスクレイピング環境が整った状態のjupyter-notebookが起動する。  
Let's Scrape

## コミットメッセージ
feat: 新しい機能  
fix: バグの修正  
docs: ドキュメントのみの変更  
style: 空白、フォーマット、セミコロン追加など  
refactor: 仕様に影響がないコード改善(リファクタ)  
perf: パフォーマンス向上関連  
test: テスト関連  
chore: ビルド、補助ツール、ライブラリ関連  