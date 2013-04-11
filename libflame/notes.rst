Notes on libflame
=================
:Author: Guilherme Freitas <guilherme@gpfreitas.com>

On the Build System
-------------------

- `./configure && make && make install` did not work on my Mac (OS X 10.7, Lion);
  the process finished without apparent errors (really?), but the examples did not run.

- `./configure --prefix` is not respected. First it doesn't instal
  libs/headers/binaries where you would expect. Second, it doesn't update the
  makefiles of the examples.

- There is hardcoded stuff in a bunch of places. Check the examples makefiles,
  for example. Specifically, LDFLAGS are hardcoded in the examples' makefiles.
  Also the `pdflatex` and other TeX binaries are hardcoded in the makefiles of
  the `docs` folder.

- They do not use automake or libtool. autoconf could probably be better used... but maybe switching to CMake
  altogether would be even better.

- They say they do not need FORTRAN... but it is not clear how to generalte the libraries without FORTRAN.

- There is no `make uninstall`!

Bugs
----

Even after the build-system stuff is changed, the `lu` test fails to compile.
To reproduce the bug, go to `libflame-r9287/examples/lu/` and run::
        make

You should get an error::

    gcc -O3 -Wall -I/Users/guilherme/flame/include -c driver.c -o driver.o
    driver.c: In function ‘main’:
    driver.c:78: warning: implicit declaration of function ‘FLA_Obj_buffer’
    driver.c:78: warning: cast to pointer from integer of different size
    gcc -O3 -Wall -I/Users/guilherme/flame/include -c REF_LU.c -o REF_LU.o
    REF_LU.c: In function ‘REF_LU’:
    REF_LU.c:16: warning: implicit declaration of function ‘FLA_Obj_buffer’
    REF_LU.c:16: warning: cast to pointer from integer of different size
    gcc -O3 -Wall -I/Users/guilherme/flame/include -c LU_unb_var1.c -o LU_unb_var1.o
    gcc -O3 -Wall -I/Users/guilherme/flame/include -c LU_blk_var1.c -o LU_blk_var1.o
    gcc -O3 -Wall -I/Users/guilherme/flame/include -c LU_unb_var2.c -o LU_unb_var2.o
    gcc -O3 -Wall -I/Users/guilherme/flame/include -c LU_blk_var2.c -o LU_blk_var2.o
    gcc -O3 -Wall -I/Users/guilherme/flame/include -c LU_unb_var3.c -o LU_unb_var3.o
    gcc -O3 -Wall -I/Users/guilherme/flame/include -c LU_blk_var3.c -o LU_blk_var3.o
    gcc -O3 -Wall -I/Users/guilherme/flame/include -c LU_unb_var4.c -o LU_unb_var4.o
    gcc -O3 -Wall -I/Users/guilherme/flame/include -c LU_blk_var4.c -o LU_blk_var4.o
    gcc -O3 -Wall -I/Users/guilherme/flame/include -c LU_unb_var5.c -o LU_unb_var5.o
    gcc -O3 -Wall -I/Users/guilherme/flame/include -c LU_blk_var5.c -o LU_blk_var5.o
    gcc driver.o REF_LU.o LU_unb_var1.o LU_blk_var1.o LU_unb_var2.o LU_blk_var2.o LU_unb_var3.o LU_blk_var3.o LU_unb_var4.o LU_blk_var4.o LU_unb_var5.o LU_blk_var5.o -L/usr/local/gfortran/lib/gcc/x86_64-apple-darwin11/4.6.2 -L/usr/local/gfortran/lib/gcc/x86_64-apple-darwin11/4.6.2/../../.. -lgfortran -lquadmath -lm /Users/guilherme/flame/lib/libflame.a /System/Library/Frameworks/vecLib.framework/Versions/A/vecLib -o driver.x
    Undefined symbols for architecture x86_64:
      "_FLA_Obj_buffer", referenced from:
          _main in driver.o
          _REF_LU in REF_LU.o
         (maybe you meant: _FLA_Obj_buffer_at_view, _FLA_Obj_buffer_at_view_check , _FLA_Obj_buffer_is_null )
    ld: symbol(s) not found for architecture x86_64
    collect2: ld returned 1 exit status
    make: *** [driver.x] Error 1




The bug is in `libflame-r9287/examples/lu/`::

        ./driver.c:    *( ( double * ) FLA_Obj_buffer( delta ) ) = d_n;
        ./REF_LU.c:  buff_A = (double *) FLA_Obj_buffer( A );


The problem is the call to `FLA_Obj_buffer`. It should be something else
(`FLA_Obj_buff_at_view` seems to work, giving no errors, but I'm not sure it
serves the intended purpose).
  
