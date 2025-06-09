from backend.models.precio_model import PrecioBase, PrecioCreate, PrecioUpdate, PrecioRead
from backend.database.supabase_client import get_supabase_client

class PrecioRepository:
    def __init__(self):
        self.supabase = get_supabase_client()
        self.table = 'precio'

    def get_by_id(self, precio_id: int):
        res = (self.supabase.table(self.table).select("*").eq("id_precio", precio_id).single().execute())
        return res.data

    def get_by_disciplina(self, disciplina_id: int):
        res = (self.supabase.table(self.table).select("*").eq("DISCIPLINA_id_disciplina", disciplina_id).execute())
        return res.data
    
    def create(self, precio: PrecioCreate):
        payload = precio.model_dump(by_alias=True)
        res = self.supabase.table(self.table).insert(payload).execute()
        return res.data
    
    def update(self, precio_id: int, precio: PrecioUpdate):
        payload = precio.model_dump(by_alias=True)
        res = (self.supabase.table(self.table).update(payload).eq("id_precio", precio_id).execute())
        return res.data
    
    def delete(self, precio_id: int):
        res = (self.supabase.table(self.table).delete().eq("id_precio", precio_id).execute())
        return res.data
        
