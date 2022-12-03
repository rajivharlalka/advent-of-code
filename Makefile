PHONY: push
push:
	ga .; \
	gcsm 'New Codes Added'; \
	git push origin main; \
	gst
