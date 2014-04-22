use v6;

use Compress::Snappy;
use Test;

multi roundtrip(Str $in) {
	return Compress::Snappy::decompress(
		Compress::Snappy::compress($in)
	).decode("utf8");
}

multi roundtrip(Blob $in) {
	return Compress::Snappy::decompress(
		Compress::Snappy::compress($in)
	);
}

my $empty = '';
is roundtrip($empty), $empty, 'roundtrip on empty string';

my $greeting = 'Hello, world!';
is roundtrip($greeting), $greeting, 'roundtrip on short greeting';

my $zeroes = '0' x 1024;
is roundtrip($zeroes), $zeroes, 'roundtrip on 1k of zeroes';

my $pattern = ([~] 'a' .. 'z') x 100;
is roundtrip($pattern), $pattern, 'roundtrip on 100 alphabets';

my $unicode = '»ö« .oO(æ€!éè)' x 100;
is roundtrip($unicode), $unicode, 'roundtrip on 100 unicode sample strings';

my $short-binary = Buf.new(0 .. 9);
is roundtrip($short-binary), $short-binary, 'roundtrip on a short binary string';

my $long-binary = Buf.new((0 .. 9) xx 1000);
is roundtrip($long-binary), $long-binary, 'roundtrip on a long binary string';

done;
