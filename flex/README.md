# flex decoder

Decodes several channels worth of FLEX pager data at once.

## Running the decoder

Start multimon-ng flex decoders on FIFOs in `chan/`:

```sh
$ ./decode_fifos.sh 
```

Start the radios to feed the FIFOs:

```sh
$ gnuradio-companion ./flex.grc
```

Watch the data fly by:

```sh
$ tail -f chan/*txt
```