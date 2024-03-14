"""
Django settings for be project.

Generated by 'django-admin startproject' using Django 4.2.7.

For more information on this file, see
https://docs.djangoproject.com/en/4.2/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/4.2/ref/settings/
"""

from pathlib import Path

# Build paths inside the project like this: BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent.parent


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/4.2/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'projectinternalorder'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = ['localhost', '127.0.0.1', 'z8v4553q-8000.asse.devtunnels.ms',
                'beinternal.jesica.online']


APPEND_SLASH = False

# Application definition

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'django.contrib.contenttypes',
    'rest_framework',
    'rest_framework_simplejwt',
    'rest_framework.authtoken',
    'detailmanpower',
    'projectinternal', 
    'projectcharter',
    'description',
    'deliverable',
    'detailmilostones',
    'milostones',
    'detail_responsibilities',
    'responsibility',
    'supporting',
    'detailsupporting',
    'approvedBy',
    'users',
    'timeline',
    'corsheaders',
    'karyawan',
    #'internalorder',

]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    'corsheaders.middleware.CorsMiddleware',
]

ROOT_URLCONF = 'be.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'be.wsgi.application'


# Database
# https://docs.djangoproject.com/en/4.2/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'db',
        'USER': 'postgres',
        'PASSWORD': '0000',
        'PORT': '5432',
        'HOST': 'localhost',
        'OPTIONS': {
            'options': '-c search_path=internal_order,project_charter',  # Menambahkan skema project_charter
        },
    }
}

REST_FRAMEWORK = {
    'DEFAULT_AUTHENTICATION_CLASSES': [
        'rest_framework_simplejwt.authentication.JWTAuthentication',
    ],
}

SIMPLE_JWT = {
    'AUTH_HEADER_TYPES': ('Bearer',),
}


# Password validation
# https://docs.djangoproject.com/en/4.2/ref/settings/#auth-password-validators

# settings.py
AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
    {
        'NAME': 'your_project.validators.BcryptPasswordValidator',  # Custom validator for bcrypt
    },
]



# MinIO configuration
# AWS_ACCESS_KEY_ID = 'fT1PGWAmAnYMMNXNVyHm'
# AWS_SECRET_ACCESS_KEY = 'TNihk5PO8iNmXem2wY09n6yqnuWQR3LiDvGPgn6k'
# AWS_STORAGE_BUCKET_NAME = 'internalorder'
# AWS_S3_ENDPOINT_URL = 'http://127.0.0.1:9000'
# AWS_S3_REGION_NAME = 'your-region'  # Optional, depending on your MinIO setup
# AWS_S3_CUSTOM_DOMAIN = '%s.s3.amazonaws.com' % AWS_STORAGE_BUCKET_NAME
# DEFAULT_FILE_STORAGE = 'storages.backends.s3boto3.S3Boto3Storage'

# # Additional optional settings
# AWS_QUERYSTRING_AUTH = False
# AWS_S3_SECURE_URLS = False
# AWS_S3_CUSTOM_DOMAIN=None

ALLOWED_HOSTS = ['beinternal.jesica.online']
AWS_S3_ENDPOINT_URL = 'http://127.0.0.1:9006'
AWS_ACCESS_KEY_ID = 'eNUujVtxMvP46N54Hpck'
AWS_SECRET_ACCESS_KEY = 'nbEx0NeH5jFPY5MuWSI9lSbjMmoXFQ0wGOwT2QHH'
AWS_STORAGE_BUCKET_NAME = 'internalorder'

# Internationalization
# https://docs.djangoproject.com/en/4.2/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/4.2/howto/static-files/

STATIC_URL = '/static/'

# Default primary key field type
# https://docs.djangoproject.com/en/4.2/ref/settings/#default-auto-field

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'


# Setting Media URL dan Root

# settings.py

# ...

# Instalasi django-storages dan boto3
# pip install django-storages boto3

# # Gunakan storage backend dari django-storages
# DEFAULT_FILE_STORAGE = 'storages.backends.s3boto3.S3Boto3Storage'

# # Konfigurasi Amazon S3
# AWS_ACCESS_KEY_ID = 'your-access-key-id'
# AWS_SECRET_ACCESS_KEY = 'your-secret-access-key'
# AWS_STORAGE_BUCKET_NAME = 'your-s3-bucket-name'
# AWS_S3_REGION_NAME = 'your-region'  # Contoh: 'us-east-1'
# AWS_S3_CUSTOM_DOMAIN = f"{AWS_STORAGE_BUCKET_NAME}.s3.amazonaws.com"

# # Gunakan HTTPS untuk koneksi ke S3 (opsional)
# AWS_S3_USE_SSL = True

# # Konfigurasi URL yang akan digunakan untuk mengakses file di S3
# # Dapat menggunakan URL yang bersifat publik atau menggunakan presigned URL (tergantung kebutuhan)
# AWS_S3_PUBLIC_URL = f"https://{AWS_STORAGE_BUCKET_NAME}.s3.amazonaws.com/"

# # Gunakan header Cache-Control untuk mengontrol caching di S3 (opsional)
# AWS_S3_OBJECT_PARAMETERS = {
#     'CacheControl': 'max-age=86400',  # Contoh: Cache selama 1 hari
# }

# # ...

# # Pengaturan tambahan untuk penyimpanan file media
# MEDIA_URL = AWS_S3_PUBLIC_URL + 'media/'
# MEDIA_ROOT = ''

# settings.py
AUTHENTICATION_BACKENDS = [
    'django.contrib.auth.backends.ModelBackend',
]

#APPEND_SLASH = False

CORS_ORIGIN_ALLOW_ALL = False

CORS_ALLOWED_ORIGINS = [
    "http://localhost:3000", "https://internal.jesica.online",
    "http://localhost:3140"
]

CORS_ALLOW_METHODS = [
    'DELETE',
    'GET',
    'OPTIONS',
    'PATCH',
    'POST',
    'PUT',
]

CORS_ALLOW_HEADERS = [
    'accept',
    'accept-encoding',
    'authorization',
    'content-type',
    'dnt',
    'origin',
    'user-agent',
    'x-csrftoken',
    'x-requested-with',
]
