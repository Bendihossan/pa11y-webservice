
# Group targets
all: deps lint test start

# Install dependencies
deps:
	@echo "Installing dependencies..."
	@npm install

# Lint JavaScript
lint:
	@echo "Linting JavaScript..."
	@./node_modules/.bin/jshint \
		--config ./test/config/jshint.json \
		index.js route/* test/*

# Run all tests
test: test-feature

# Run feature tests
test-feature:
	@echo "Running feature tests..."
	@./node_modules/.bin/cucumber-js \
		./test/feature

# Start the application
start:
	@echo "Starting application..."
	@NODE_ENV=production node .

# Start the application in development mode
start-dev:
	@echo "Starting application (development mode)..."
	@NODE_ENV=development ./node_modules/.bin/supervisor -q .

# Start the application in test mode
start-test:
	@echo "Starting application (test mode)..."
	@NODE_ENV=test ./node_modules/.bin/supervisor -q .