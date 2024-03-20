from django.urls import path
from .views import DetailTimelineListCreateAPIView, DetailTimelinePublicListCreateAPIView, DetailTimelinePublicDetailAPIView

urlpatterns = [
    path('timeline/', DetailTimelineListCreateAPIView.as_view(), name='detail-timeline-list-create'),
    path('timeline/<int:id_project>/', DetailTimelineListCreateAPIView.as_view(), name='detail-timeline-list-create-by-id-project'),
    # path('timeline/<int:pk>/', DetailTimelineDetailAPIView.as_view(), name='detail-timeline-detail'),
    # path('timeline/delete/', DeleteTimelineByProjectAPIView.as_view(), name='delete-timeline-by-project'),
    path('timelinemobile/', DetailTimelinePublicListCreateAPIView.as_view(), name='public-detail-timeline-list-create'),  # Perubahan nama path
    path('timelinemobile/<int:pk>/', DetailTimelinePublicDetailAPIView.as_view(), name='public-detail-timeline-detail'),  # Perubahan nama path
    # path('timeline/login/', get_user_info, name='get_user_info'),
]
