all:
	mmc --make --enable-termination --warn-unused-imports --warn-dead-procs --intermodule-optimization bp

clean:
	rm -f *.mh *.err bp
	rm -rf Mercury
