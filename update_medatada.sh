#!/usr/bin/env bash
# created on 20/11/17
# this script take pdf files as arguments and replace(actually apppend fix need!)
#the title with the file name
for i in $*; do
pdftk $i dump_data output metadata.txt
mv $i _$i
line=$(($(sed -n '/InfoKey: Title/=' metadata.txt)+1))
old_title=$(sed -n "${line}p" metadata.txt)
sed -i "${line}s/${old_title}/InfoValue: $i/" metadata.txt
#if [[ -z "$PDF_AUTHOR" ]]; then
#	line=$(($(sed -n '/InfoKey: Author/=' metadata.txt)+1))
#	old_author=$(sed -n "${line}p" metadata.txt)
#	sed -i "${line}s/${old_author}/InfoValue: $PDF_AUTHOR/" metadata.txt
#fi
pdftk _$i update_info metadata.txt output $i
rm _$i
#rm metadata.txt
done


