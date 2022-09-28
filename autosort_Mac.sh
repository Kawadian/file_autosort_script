#!/bin/bash
#自動的に仕分けるディレクトリを指定
#最後に必ず「/*」をつけること!
Directory_source="/path/to/source/*"
#追加されたファイルを格納
FILE="`find $Directory_source -type f -name .DS_Store -prune -o -type f -name Thumbs.db -prune -o -maxdepth 0 -print`"
#追加されたファイルの曜日を確認
Youbi=`date -r $Directory_source "+%a"`
#”曜日”を追加
Addtext="曜日"
#曜日を日本語化
if [ $Youbi = "Mon" ]; then
  Youbi="月"
elif [ $Youbi = "Tue" ]; then
  Youbi="火"
elif [ $Youbi = "Wed" ]; then
  Youbi="水"
elif [ $Youbi = "Thu" ]; then
  Youbi="木"
elif [ $Youbi = "Fri" ]; then
  Youbi="金"
elif [ $Youbi = "Sat" ]; then
  Youbi="土"
elif [ $Youbi = "Sun" ]; then
  Youbi="日"
fi
Youbi_added=$Youbi$Addtext
#移動先のディレクトリを指定
Directory_addto="/path/to/add/to/"
Directory_for=$Directory_addto$Youbi_added
if [ -e $Directory_for ]; then #ディレクトリが存在するか確認
  #存在する場合
  mv "$FILE" $Directory_for
else
  #存在しない場合
  mkdir $Directory_for
  mv "$FILE" $Directory_for
fi