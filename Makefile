#make for build mkbootimg 
#create by sn 2012-5-23 21:14:18
CC = gcc
LD = ld
AR = ar
LDCFLAGES =
STATIC_LIB = libmincrypt.a
#MKBOOTIMG_TARGET = arm-mkbootimg
MKBOOTIMG_OBJ = mkbootimg.o
MKBOOTIMG_SRC = mkbootimg.c
#UNPACKBOOT_TARGET = arm-unpackbootimg
UNPACKBOOTIMG_OBJ = unpackbootimg.o
UNPACKBOOTIMG_SRC = unpackbootimg.c
LIBMINCRYPT_OBJ = sha.o rsa.o
SHA_SRC = sha.c
RSA_SRC = rsa.c
MKBOOTFS_OBJ = mkbootfs.o
MKBOOTFS_SRC = mkbootfs.c
all:mkbootimg               #此处定义编译mkbootimg
mkbootimg:$(MKBOOTIMG_OBJ);$(CC) -o $@ $< $(STATIC_LIB)

$(MKBOOTIMG_OBJ):$(MKBOOTIMG_SRC);$(CC) -c $<

unpackboot:unpackbootimg              #此处定义编译unpackbootimg
unpackbootimg:$(UNPACKBOOTIMG_OBJ);$(CC) -o $@ $< $(STATIC_LIB)
$(UNPACKBOOTIMG_OBJ):$(UNPACKBOOTIMG_SRC);$(CC) -c $<

lib:libmincrypt.a                     #此处定义编译libmincrypt.a
libmincrypt.a:$(LIBMINCRYPT_OBJ);$(AR) -r $(STATIC_LIB) $(LIBMINCRYPT_OBJ) 
sha.o:$(SHA_SRC);$(CC) -c -fPIC $<
rsa.o:$(RSA_SRC);$(CC) -c -fPIC $<

mkboot:mkbootfs                  #此处定义了编译mkbootfs
mkbootfs:$(MKBOOTFS_OBJ);$(CC) -o $@ $<
$(MKBOOTFS_OBJ):$(MKBOOTFS_SRC);$(CC) -c $<

#clean:                    #此处定义了要清除的文件
# rm -f mkbootfs mkbootimg unpackbootimg $(MKBOOTIMG_OBJ)  $(UNPACKBOOTIMG_OBJ) $(LIBMINCRYPT_OBJ) $(STATIC_LIB) $(MKBOOTFS_OBJ)
