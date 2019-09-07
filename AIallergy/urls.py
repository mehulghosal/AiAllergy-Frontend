from django.contrib import admin
from django.urls import include, path

urlpatterns = [
    path('bruh/', include('bruh.urls')),
    path('admin/', admin.site.urls),
]