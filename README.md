
# `passgen`

This application generates strong passwords.


## Installation

- git clone https://github.com/devon72/passgen
- cd passgen
- rake install
    
## Usage

`passgen` supports `getopts` arguments which allow you do adjust the character set used to generate your password:
- `-a` will add the lowercase alphabet.
- `-A` will add the uppercase alphabet.
- `-s` will add symbols (!@#$%^&*).
- `-n` will add numbers 0 through 9.


## Contributing

1. Fork it (https://github.com/devon72/passgen/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request