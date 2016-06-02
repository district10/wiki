all: 

qiniu:
	qrsync conf.json

clean:
	rm -rf publish
