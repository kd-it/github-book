all: build

build:
	jupyter book build .

pdf:
	@echo "=== [warn]この機能は動かないことがあります ==="
	jupyter book build --builder pdfhtml .

clean:
	jupyter book clean .

server:
	sphinx-autobuild --delay 3 --open-browser . _build
