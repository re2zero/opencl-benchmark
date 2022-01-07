kernel void hello(global ulong *val) {
  size_t i = get_global_id(0);
  for (ulong j = 0; j < 1000000000; j++) {
    val[i] += j;
  }
}
