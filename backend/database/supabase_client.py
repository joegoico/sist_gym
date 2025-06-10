from supabase import create_client
from dotenv import load_dotenv
import os
from pathlib import Path


# Obtener la ruta del directorio actual y el archivo .env
current_dir = Path(__file__).resolve().parent.parent
env_path = current_dir / '.env'

# Cargar variables de entorno
load_dotenv(env_path)

# Obtener credenciales de Supabase
SUPABASE_URL = os.getenv("SUPABASE_URL")
SUPABASE_SERVICE_ROLE_KEY = os.getenv("SUPABASE_SERVICE_ROLE_KEY")

if not SUPABASE_URL or not SUPABASE_SERVICE_ROLE_KEY:
    raise ValueError("Las variables de entorno SUPABASE_URL y SUPABASE_SERVICE_ROLE_KEY son requeridas")

# Crear cliente de Supabase
supabase = create_client(SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY)

# Función para obtener el cliente de Supabase
def get_supabase_client():
    return supabase 