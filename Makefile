MANAGE := poetry run python manage.py

.PHONY: runserver
runserver:
	@$(MANAGE) runserver

.PHONY: plusrunserver
plusrunserver:
	@$(MANAGE) runserver_plus --cert-file cert.crt

.PHONY: makemigrations
makemigrations:
	@$(MANAGE) makemigrations

.PHONY: migrate
migrate:
	@$(MANAGE) migrate

.PHONY: collectstatic
collectstatic:
	@$(MANAGE) collectstatic

.PHONY: shell
shell:
	@$(MANAGE) shell_plus

.PHONY: install
install:
	poetry install

.PHONY: flake8
flake8:
	poetry run flake8 bookmarks

.PHONY: black-check
black-check:
	poetry run black --check bookmarks  
# poetry run black --check --exclude=migrations bookmarks (без настроек в pyproject)

.PHONY: black-diff
black-diff:
	poetry run black --diff bookmarks
# poetry run black --diff --exclude=migrations bookmarks  (без настроек в pyproject)

.PHONY: black
black:
	poetry run black bookmarks
# poetry run black --exclude=migrations bookmarks  (без настроек в pyproject)

.PHONY: isort-check
isort-check:
	poetry run isort bookmarks --check-only

.PHONY: isort-diff
isort-diff:
	poetry run isort bookmarks --diff

.PHONY: isort
isort:
	poetry run isort bookmarks

.PHONY: exportreq
exportreq:
	poetry export -f requirements.txt --output requirements.txt

.PHONY: makemessages
makemessages:
	cd bookmarks/ ;\
	poetry run django-admin makemessages -l ru ;\
	cd ..

.PHONY: compilemessages
compilemessages:
	cd bookmarks/ ;\
	poetry run django-admin compilemessages ;\
	cd ..

.PHONY: test
test:
	poetry run pytest

.PHONY: test-coverage
test-coverage: # запись покрытия для CodeClimate
	poetry run pytest --cov=bookmarks --cov-report xml