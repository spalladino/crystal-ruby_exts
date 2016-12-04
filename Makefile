sample.bundle: samples/sample.cr
	crystal samples/sample.cr --link-flags "-dynamic -bundle -Wl,-undefined,dynamic_lookup" -o sample.bundle

irb: sample.bundle
	irb -rsample -I.

clean:
	rm -rf .crystal sample.bundle
