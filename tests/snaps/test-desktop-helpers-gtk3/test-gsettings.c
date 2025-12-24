#include <stdio.h>
#include <glib.h>
#include <gio/gio.h>

int main (int argc, char **argv)
{
	gint result = 0;
	const gchar *schema_id = "org.gnome.desktop.interface";
	const gchar *key = "gtk-theme";
	if (argc > 1 && argv[1] != NULL)
			schema_id = g_strdup (argv[1]);
	if (argc > 2 && argv[2] != NULL)
		key = g_strdup (argv[2]);

	GSettings *settings = g_settings_new (schema_id);
	gchar *value = g_settings_get_string (settings, key);

	g_print("Schema: %s Key: %s Value: %s\n", schema_id, key, value);
	return result;
}
