# Generated by Django 4.2.7 on 2023-12-08 03:07

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Deliverable',
            fields=[
                ('id_deliverable', models.AutoField(primary_key=True, serialize=False)),
                ('deliverables', models.CharField(blank=True, max_length=255, null=True)),
            ],
            options={
                'db_table': 'deliverable',
                'managed': False,
            },
        ),
    ]
