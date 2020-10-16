## delete pycache, build files
clean:		
	@rm -rf build build.zip

## create Docker image with requirements
docker-build:		
	docker-compose build

## run "src.lambda_function.lambda_handler" with docker-compose
## mapping "./tmp" and "./src" folders. 
## "event.json" file is load and provided to lambda function as event parameter  
lambda-run:			
	docker-compose run lambda src/handler '$(shell cat "event.json")'

## prepares build.zip archive for AWS Lambda deploy 
## remember to set in lambda definition:
## 		 Handler: src/lambda_function.lambda_handler
lambda-build: clean 
	mkdir build build/lib
	cp -r src build/.
	cd build; zip -9qr build.zip .
	cp build/build.zip .
	rm -rf build