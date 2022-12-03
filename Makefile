.PHONY: push
push:
	git add --all; \
	git commit -sm 'New Codes Added'; \
	git push origin main; \
	git status;
