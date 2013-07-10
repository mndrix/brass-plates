bp: *.m
	mmc --make --enable-termination --warn-unused-imports --warn-dead-procs --intermodule-optimization bp

png: bp
	./bp png

clean:
	rm -f *.mh *.err bp
	rm -rf Mercury
