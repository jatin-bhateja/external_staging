for %I in (*emon.dat) DO basename %I .emon.dat >> bmlist.txt
for /f %I in (bmlist.txt) DO process.cmd %I && ren summary.xlsx  %I.xlsx
