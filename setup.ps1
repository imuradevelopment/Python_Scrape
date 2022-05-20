# 変数定義
$venv = ".venv"
$requirements = "requirements.txt"

# powershell設定
$TmpErrorActionPreference = $ErrorActionPreference
$ErrorActionPreference = "Stop"

# コンソール出力関数
function SuccessConsole([String]$message, [int]$type = 0){
    if($type -eq 0){
        Write-Host $message -BackGroundColor Black -ForeGroundColor Green
    }else{
        Write-Host $message -BackGroundColor Black -ForeGroundColor Green -NoNewline
    }
}
function ErrorConsole([String]$message){
    Write-Host $message -BackGroundColor Black -ForeGroundColor Red
}

# 事前準備チェック
try {
    python --version  2>&1 | Out-Null
}
catch {
    ErrorConsole "pythonコマンドが使用できません。"
    ErrorConsole "READMEに従って事前準備を済ませてください。"
    exit
}

# 仮想環境の作成
if(!(Test-Path $venv)){
    SuccessConsole "仮想環境を作成します..." 1
    python -m venv $venv
    SuccessConsole "OK"
}

# 仮想環境のdeactive化
SuccessConsole "仮想環境をdeactivateにします..." 1
try {
    deactivate
    SuccessConsole "OK"
}
catch {
    ErrorConsole "仮想環境がactiveではなかった為、操作は行われませんでした"
}

# 仮想環境のactive化
SuccessConsole "仮想環境をactivateにします..." 1
try {
    .venv\Scripts\activate.ps1
    SuccessConsole "OK"
}
catch {
    ErrorConsole "想定外のエラーにより、仮想環境がactive化できませんでした"
}

# ライブラリのインストール
SuccessConsole "requirements.txtのコピーを作成します..." 1
if(!(Test-Path $requirements)){
    ErrorConsole "requirements.txtが存在しなかった為、操作は行われませんでした"
}
else{
    Copy-Item "requirements.txt" "requirements_$(Get-Date -Format "yyyyMMdd_HHmmss").txt"
    SuccessConsole "OK"

    # ライブラリのインストール
    SuccessConsole "requirements.txtのライブラリをinstallします..." 1
    $TmpWarningPreference = $WarningPreference
    $WarningPreference = 'SilentlyContinue'
    pip install -r requirements.txt 2>&1 | Out-Null
    $WarningPreference = $TmpWarningPreference
    SuccessConsole "OK"

    # jupyter-notebookの起動
    SuccessConsole "jupyter-notebookを起動します..."
    try {
        jupyter-notebook --no-browser
    }
    catch {
        ErrorConsole "要件を満たすrequirements.txtが存在しませんでした"
    }
}

# powershell設定（戻し）
$ErrorActionPreference = $TmpErrorActionPreference