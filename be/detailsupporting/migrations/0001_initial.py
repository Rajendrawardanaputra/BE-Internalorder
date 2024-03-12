# Generated by Django 4.2.7 on 2023-12-08 03:07

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='DetailSupportingDoc',
            fields=[
                ('id_detail_supporting_doc', models.AutoField(primary_key=True, serialize=False)),
                ('document_name', models.CharField(blank=True, max_length=255, null=True)),
                ('note', models.CharField(blank=True, max_length=255, null=True)),
                ('document', models.FileField(blank=True, max_length=255, null=True, upload_to='supportingdoc/')),
            ],
            options={
                'db_table': 'detail_supporting_doc',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='SupportingDoc',
            fields=[
                ('document_name', models.CharField(blank=True, max_length=255, null=True)),
                ('notes', models.CharField(blank=True, max_length=255, null=True)),
                ('document', models.CharField(blank=True, max_length=255, null=True)),
                ('id_supporting', models.AutoField(primary_key=True, serialize=False)),
            ],
            options={
                'db_table': 'supporting_doc',
                'managed': False,
            },
        ),
    ]