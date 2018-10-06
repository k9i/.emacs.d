# .emacs.d と単なるメモ書き

## 小技?
- 変数の内容をバッファにペーストする
  - ``C-u 0 M-: {変数名}``

## shortcut key
- rectangle selection mode への切り替え(rectangle-mark-mode): `C-x SPC`
- rectangle kill : `C-x r k`
- rectangle string: `C-x r s`
  - 矩形領域を任意の文字で置き換える
  - 視覚的な一括インデント(open-recatangel)の代わりにも使えそう
- 一括インデント(open-rectangle): `C-x r o`
- 一括アンインデント(delete-rectangle): `C-x r d`

## usefull packages
* yaml-mode
* which-key
* magit

## packageの使い方
1. list packages:
  M-x package-list-packages
    or 
  M-x package-list-packages-no-fetech
2. select package to install:  i
3. install package: x

## face名の確認
M-x list-faces-display

https://www.emacswiki.org/emacs/Face#face

M-x descibe-face
# ediff-even-diff-A

M-x what-cursor-position
C-u C-x =

You can run the command ‘describe-face’ with M-x d-fa RET
