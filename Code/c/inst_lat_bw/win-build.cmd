icl /c /Od pause.c
icl /c /Od instlat.c
icl /c /Od bindtocpu.c
icl /c /Od util.c
icl /c /Od stores.c
icl /c /Od loads.c
icl /c /Od lock.c
icl /c /Od fpops.c

icl /Feinstlat.exe pause.obj lock.obj fpops.obj loads.obj stores.obj instlat.obj bindtocpu.obj util.obj advapi32.lib