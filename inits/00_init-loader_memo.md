# init-loader memo

## url
https://github.com/emacs-jp/init-loader

## Files to be loader
- 00_util.el
- 01_ik-cmd.el
- 21_javascript.el
- 99_global-keys.el

## prefix

| Platform  | Subplatform       | Prefix          | Example                     |
| --------- | ----------------- | --------------- | --------------------------- |
| Windows   |                   | `windows-`      | windows-fonts.el            |
|           | Meadow            | `meadow-`       | meadow-commands.el          |
| Mac OS X  | Carbon Emacs      | `carbon-emacs-` | carbon-emacs-applescript.el |
|           | Cocoa Emacs       | `cocoa-emacs-`  | cocoa-emacs-plist.el        |
| GNU/Linux |                   | `linux-`        | linux-commands.el           |
| All       | Non-window system | `nw-`           | nw-key.el                   |

## Usage

### from https://gist.github.com/tarao/4362564

;;; 使い方
;; load-pathの通った場所に置いて
;; (require 'init-loader)
;; (init-loader-load "/path/to/init-directory")

;;  デフォルト設定の場合,以下の順序で引数に渡したディレクトリ以下のファイルをロードする.
;; 引数が省略された場合は,変数`init-loader-directory'の値を使用する.デフォルトは"~/.emacs.d/inits".

;; 1. ソートされた,二桁の数字から始まるファイル. e.x, "00_utils.el" "01_ik-cmd.el" "21_javascript.el" "99_global-keys.el"
;; 2. meadowの場合, meadow から始まる名前のファイル. e.x, "meadow-cmd.el" "meadow-config.el"
;; 3. carbon-emacsの場合, carbon-emacs から始まる名前のファイル. e.x, "carbon-emacs-config.el" "carbon-emacs-migemo.el"
;; 4. windowシステム以外の場合(terminal), nw から始まる名前のファイル e.x, "nw-config.el"

;; ファイルロード後,変数`init-loader-show-log-after-init'の値がnon-nilなら,ログバッファを表示する関数を`after-init-hook'へ追加する.
;; ログの表示は, M-x init-loader-show-log でも可能.
