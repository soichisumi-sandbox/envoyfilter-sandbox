install-mockoon-cli:
# setup node v10 ro above
	npm install -g @mockoon/cli 

mockoon-dockernize:
	mockoon-cli dockerize --data mockoon.json --output ./Dockerfile

push-dockerhub:
	docker build -t soichisumi0/mockoon-mockserver:latest .
	docker push docker.io/soichisumi0/mockoon-mockserver:latest 