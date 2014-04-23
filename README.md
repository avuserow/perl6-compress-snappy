# NAME

Compress::Snappy - (de)compress data in Google's Snappy compression format

# SYNOPSIS

```perl6
# compress Strs as UTF8 by default
my Buf $compressed = Compress::Snappy::compress('hello, world');
# or pick your encoding
my Buf $compressed = Compress::Snappy::compress('hello, world', 'utf16');
# or provide a buf
my Buf $compressed = Compress::Snappy::compress(Buf.new(0, 1, 2, 3));

# validate it...
my Bool $valid = Compress::Snappy::validate($compressed);

# and decompress to a Buf
my Buf $decompressed = Compress::Snappy::decompress($compressed);
# or a specific encoding
my Str $decompressed = Compress::Snappy::decompress($compressed, 'utf8');
```

See also examples/test.p6

# DESCRIPTION

This module uses NativeCall to provide bindings to the C API for libsnappy, a .

# FUNCTIONS

## Compress::Snappy::compress(Blob $uncompressed) returns Buf

Main compression function. Returns a Buf of compressed data.

## Compress::Snappy::compress(Str $uncompressed) returns Buf

Convenience function to make a Str to a utf8-encoded Blob and compress that.

## Compress::Snappy::decompress(Blob $compressed) returns Buf

Decompress provided data to a Buf.

## Compress::Snappy::validate(Blob $compressed) returns Bool

Returns if the compressed data is valid, without fully decompressing it.

# SEE ALSO

[Snappy](https://github.com/google/snappy)
