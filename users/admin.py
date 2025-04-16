from django.contrib import admin
from django.contrib.auth.models import User
from django.contrib.auth.admin import UserAdmin
from .models import UserProfile

# Inline to attach UserProfile inside User Admin
class UserProfileInline(admin.StackedInline):  
    model = UserProfile
    can_delete = False
    verbose_name_plural = 'User Profiles'

# Customizing the User Admin
class CustomUserAdmin(UserAdmin):
    inlines = (UserProfileInline,)  # Attach UserProfile to UserAdmin
    list_display = ('username', 'first_name', 'last_name', 'email', 'get_mobile_number')  # Show extra fields
    search_fields = ('username', 'first_name', 'last_name', 'email', 'userprofile__mobile_number')  # Enable search

    def get_mobile_number(self, obj):
        return obj.userprofile.mobile_number if hasattr(obj, 'userprofile') else 'N/A'

    get_mobile_number.short_description = 'Mobile Number'

# Unregister default User model and register our customized User model
admin.site.unregister(User)
admin.site.register(User, CustomUserAdmin)

# Register UserProfile separately (optional)

class UserProfileAdmin(admin.ModelAdmin):
    list_display = ('user', 'mobile_number')
    search_fields = ('user__username', 'mobile_number')
