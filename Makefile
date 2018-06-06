.PHONY: runserver migrate shell createsuperuser makemigrations

TAG="\n\n\033[0;32m\#\#\# "
END=" \#\#\# \033[0m\n"

HOST=0.0.0.0
PORT=8080
PROJECT_NAME=website
PYTHONPATH=$(PROJECT_NAME)
DJANGO_SETTINGS=$(PROJECT_NAME).settings.base

django-command = django-admin $(1) $(2) --settings $(DJANGO_SETTINGS) --pythonpath $(PYTHONPATH)

runserver:
	@echo $(TAG)Running Server $(END)
	$(call django-command, runserver, $(HOST):$(PORT))

shell:
	@echo $(TAG)Running Shell $(END)
	$(call django-command, shell)

makemigrations:
	@echo $(TAG)Creating Migrations$(END)
	$(call django-command, makemigrations)

migrate:
	@echo $(TAG)Migrating Database$(END)
	$(call django-command, migrate)

createsuperuser:
	@echo $(TAG)Create Superuser$(END)
	$(call django-command, createsuperuser)
	# admin/admin
