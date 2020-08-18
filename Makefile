
c clean:
	rm -rf ./pw

dpw download-pw:

	rm -f ./pw/.gitkeep
	rm -f ./pw/.gitattributes
	
	git clone git://github.com/processwire/processwire.git -b dev ./pw
	
	rm -rf ./pw/.git
	rm -f ./pw/.DS_Store

dcu docker-up:
	docker-compose up -d

i install:
	make clean
	make download-pw
	make docker-up
