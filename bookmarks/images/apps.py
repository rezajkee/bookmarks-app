from django.apps import AppConfig


class ImagesConfig(AppConfig):
    default_auto_field = "django.db.models.BigAutoField"
    name = "bookmarks.images"

    def ready(self):
        # Import signal handlers
        import bookmarks.images.signals  # NOQA: F401
