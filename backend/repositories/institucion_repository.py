from backend.models.institucion_model import InstitucionCreate, InstitucionUpdate, InstitucionRead
from backend.database.supabase_client import get_supabase_client

class InstitucionRepository:
    def __init__(self):
        self.client = get_supabase_client()
        self.table = 'institucion'

    def get_by_id(self, id: int):
        return self.client.table(self.table).select('*').eq('id_institucion', id).execute().data[0]
    

    def create(self, institucion: InstitucionCreate):
        payload = institucion.model_dump()
        return self.client.table(self.table).insert(payload).execute().data[0]
    
    def update(self, id: int, institucion: InstitucionUpdate):
        payload = institucion.model_dump(exclude_none=True)
        return self.client.table(self.table).update(payload).eq('id_institucion', id).execute().data
    
    def delete(self, id: int):
        return self.client.table(self.table).delete().eq('id_institucion', id).execute().data
        
