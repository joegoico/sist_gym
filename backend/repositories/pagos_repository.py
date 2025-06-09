from backend.models.pagos_model import PagoCreate, PagoUpdate, PagoRead
from backend.database.supabase_client import get_supabase_client

class PagoRepository:
    def __init__(self):
        self.supabase = get_supabase_client()
        self.table = 'pago'

    def get_by_id(self, pago_id: int):
        res = (self.supabase.table(self.table).select("*").eq("id_pago", pago_id).single().execute())
        return res.data

    def get_by_alumno(self, alumno_id: int):
        res = (self.supabase.table(self.table).select("*").eq("alumno_id_alumno", alumno_id).execute())
        return res.data

    def create(self, pago: PagoCreate):
        payload = pago.model_dump(by_alias=True)
        res = self.supabase.table(self.table).insert(payload).execute()
        return res.data

    def update(self, pago_id: int, pago: PagoUpdate):
        payload = pago.model_dump(by_alias=True)
        res = (self.supabase.table(self.table).update(payload).eq("id_pago", pago_id).execute())
        return res.data

    def delete(self, pago_id: int):
        res = (self.supabase.table(self.table).delete().eq("id_pago", pago_id).execute())
        return res.data

