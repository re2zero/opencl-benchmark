int runProgram(int number) {
    const base = 0xF;

    while(number >= 1) {
        int mod = (int)fmod((float)number, (float)base);
        number = number / base;
    }
    return 0;
}


kernel void hello(global ulong *val) {

    int number = 0xDAC;
    const base = 0xF + 1;

    while(number >= 1) {
        int last = number;

        int mod = (int)fmod((float)number, base);
        number = number >> 4;
        printf("Was: %x, number: %x, mod: %x \n", last, number, mod);
    }

}

kernel void hello2(global ulong *val) {

  printf("\n Starting... \n");
   // val[index] = result;
  for (size_t i = 0xF9; i <= 0xFF; i++) {

    size_t result = i - 2 + 2;

    result = runProgram(i);
    if (result > 0) {
        printf("Found!!!: %x\n", result);

        size_t index = get_global_id(0);
        val[index] = result;
    }

  }
}



int check(int* arr, int n) {
   printf("Starting checking: %d\n", n);
   printf("Arr value %d: %d\n", n, arr[n]);

  for (int i = 0; i < 16; i++) {
      printf("%d", arr[i]);
  }
   ulong k=0;
   for (int j = 0; j < 10000000; j++) {

    if (j == 100000) {
       //return arr[j];

       //size_t index = get_global_id(0);

    }
    k += j;

    // int result = getLast(arr[2], result);
  }
  return k;
}

/*
int getLast(int n) {
  if (n > 0) {}
  return n;
}
*/
int generateFormula(int maxDigits) {
  int *arr[maxDigits];
  int result = 0;

  //printf("maxDigits: %d\n", maxDigits);
  printf("Arr init value: ");

  for (int i = 0; i < maxDigits; i++) {
      arr[i] = i;
  }

  for (int i = 0; i < maxDigits; i++) {
      printf("%d", arr[i]);
  }


  printf("\nStarting generation..\n");

  for (int j = 0; j < maxDigits; j++) {

  printf("Loop: %d.. %d\n", j, arr[j]);
    int k = check(arr, j);
    if (k > 0) {
        return k;
    }

    // int result = getLast(arr[2], result);
  }

  return  result;//3 * maxDigits;
}

int findFormula(int max) {
  int result = 0;
  int i = max;

  printf("max length: %d\n", max);

  //for (int i = (max - 2); i <= max; i++) {
    printf("findFormula: %d\n", i);
    result = generateFormula(i);
    if (result > 0) {
        return result;
    }
  //}
  return result;
}


/*
int fibonacci(int number) {
    if ((number == 0) || (number == 1)) {
      return number;
    } else {
      return fibonacci(number - 1) + fibonacci(number - 2);
    }
}
*/
/*
  0123456789
  +-* / ( ) % ^, # n
Sample: n^2 - n + 41
*/