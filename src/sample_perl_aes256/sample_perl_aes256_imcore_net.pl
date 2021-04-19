#!/usr/bin/env perl

# http://www.imcore.net | hosihito@gmail.com
# Developer. Kyoungbin Lee
# 2012.09.07

# AES256 EnCrypt / DeCrypt

use strict;
use warnings;

use Digest::MD5 ();
use MIME::Base64 ();
use Crypt::CBC ();

my $key = 'abcdefghijklmnopqrstuvwxyz123456';
my $cipher = Crypt::CBC->new(
        -key         => $key,
        -literal_key => 1,
        -cipher      => 'Crypt::OpenSSL::AES',
        -header      => 'none',
        -iv          => pack('C*', map {0x00} 1..16),
);


sub AES_Encode {
    my $plain_text  = $_[0];
    my $cipher_text = $cipher->encrypt($plain_text);
    my $base64_text = MIME::Base64::encode_base64($cipher_text);
    print $base64_text;
    return 0;
}


sub AES_Decode {
    my $base64_text = $_[0];
    my $cipher_text = MIME::Base64::decode_base64($base64_text);
    my $plain_text  = $cipher->decrypt($cipher_text);
    print $plain_text;
    return 0;
}

&AES_Encode('imcore.net');
&AES_Decode('kWyuTmUELRiREWIPpLy3ZA==');