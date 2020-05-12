#perl -i -pe 's/(\d*\.\d*)/sprintf("%.2f",$1)/ge' unrounded.txt
#rounds file entries by 2 decimals inplace
