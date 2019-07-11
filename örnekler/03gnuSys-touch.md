1. mkdir 1; mkdir 2;
2. mkdir ornek{0..9}
3. mkdir 1 | mkdir 2 | mkdir 3 ...
4. mkdir 1 && mkdir 2 && ...
5. mkdir 1 2 3 4 5 6
6. for i in {0..9}; do mkdir "dizin${i}"; done
7. mkdir `seq 0 9`
8. while read line; do mkdir "$line"; done < dizinler.txt