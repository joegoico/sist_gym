from supabase import create_client
from dotenv import load_dotenv
import os
import logging
from pathlib import Path

# Configurar logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

# Obtener la ruta del directorio actual y el archivo .env
current_dir = Path(__file__).resolve().parent.parent
env_path = current_dir / '.env'

# Log para debug
logger.info(f"Buscando .env en: {env_path}")

# Cargar variables de entorno
load_dotenv(env_path)

# Obtener credenciales de Supabase
SUPABASE_URL = os.getenv("SUPABASE_URL")
SUPABASE_KEY = os.getenv("SUPABASE_KEY")

# Log para debug
logger.info(f"Directorio actual: {os.getcwd()}")
logger.info(f"SUPABASE_URL encontrada: {'Sí' if SUPABASE_URL else 'No'}")
logger.info(f"SUPABASE_KEY encontrada: {'Sí' if SUPABASE_KEY else 'No'}")

if not SUPABASE_URL or not SUPABASE_KEY:
    raise ValueError("Las variables de entorno SUPABASE_URL y SUPABASE_KEY son requeridas")

# Crear cliente de Supabase
supabase = create_client(SUPABASE_URL, SUPABASE_KEY)

# Función para obtener el cliente de Supabase
def get_supabase_client():
    return supabase 