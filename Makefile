docker-build:
	docker build -t name:AmazonLambdaSetup .

docker-copy:
	$(eval id=$(shell docker create name:AmazonLambdaSetup)) 
	docker cp $(id):/opt/app/lib .
	docker rm -v $(id)

docker-zip:
	zip -r panda_and_request_layer.zip lib


docker-push-aws:
	aws lambda publish-layer-version --layer-name pandas --zip-file fileb://panda_and_request_layer.zip - compatible-runtimes python3.6