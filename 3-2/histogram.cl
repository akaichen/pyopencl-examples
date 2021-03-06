typedef struct {
  unsigned char red;
  unsigned char green;
  unsigned char blue;
} Pixel;

__kernel void histogram(__global Pixel* pixels, volatile __global unsigned int* result)
{
  unsigned int gid = get_global_id(0);

  atomic_inc(result + pixels[gid].red);
  atomic_inc(result + pixels[gid].green + 256);
  atomic_inc(result + pixels[gid].blue + 512);
}
