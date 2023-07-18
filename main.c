#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include "sodium.h"

typedef uint32_t integerType;
typedef uint32_t sizeType;

sizeType my_size = 256;

integerType sdot(sizeType n, integerType *ix, integerType *iy){
    integerType result;
    for(sizeType i = 0; i < n; ++i){
        result += ix[i] * iy[i];
    }
    return result;
}

int main() {

    integerType *ix, *iy;
    sizeType n = my_size;
    ix = (integerType *) malloc(my_size * sizeof(integerType));
    iy = (integerType *) malloc(my_size * sizeof(integerType));

    if (sodium_init() < 0) {
        /* panic! the library couldn't be initialized, it is not safe to use */
        return 1;
    }

    for(sizeType i = 0; i < my_size; ++i){
        ix[i] = randombytes_uniform(255);
        iy[i] = randombytes_uniform(255);
    }

    integerType dot_product = sdot(my_size, ix, iy);
    printf("Here is the dot product %d \n", dot_product);
    return 0;
}
